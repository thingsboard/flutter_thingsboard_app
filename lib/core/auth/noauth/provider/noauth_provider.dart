import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
part 'noauth_provider.g.dart';

/// Storage keys `ThingsboardClient.init()` reads to restore a session (see
/// `thingsboard_client_base.dart` in `../thingsboard-dart-client/ce`, a path
/// dependency with no version pin to check against). The QR switch writes them
/// directly to hand the freshly created client exactly the exchanged pair, so
/// they must be kept in sync with the client.
const _jwtTokenStorageKey = 'jwt_token';
const _refreshTokenStorageKey = 'refresh_token';

const _hostRequestTimeout = Duration(seconds: 20);

final class SwitchEndpointParams {
  const SwitchEndpointParams({required this.data});

  final SwitchEndpointArgs data;
}

/// The step the switch is currently on. The view resolves it to localized
/// copy: the provider has no BuildContext.
enum NoAuthStep { fetchingSession, loggingIn, switchingHost }

/// What went wrong. The view resolves it to localized copy and falls back to
/// the server's message only for [unknown].
enum NoAuthFailure {
  /// No HTTP answer from the target host at all (timeout, refused, DNS).
  connectionFailed,
  tokenExchangeFailed,
  sessionInvalid,
  unknown,
}

final class SwitchEndpointFailure implements Exception {
  const SwitchEndpointFailure(
    this.failure, {
    this.serverMessage,
    this.status,
    this.cause,
  });

  final NoAuthFailure failure;
  final String? serverMessage;

  /// Diagnostics only, reaching the logs through [toString]: the
  /// classification has already happened in `_asFailure`. [cause] is what
  /// separates a timeout from a refused connection or a bad certificate.
  final int? status;
  final DioExceptionType? cause;

  @override
  String toString() =>
      'SwitchEndpointFailure($failure, status: $status, cause: $cause, '
      'serverMessage: $serverMessage)';
}

typedef _Session = ({String? token, String? refreshToken});

/// A pair the server just handed out: the access token is always present.
typedef _ExchangedSession = ({String token, String? refreshToken});

@riverpod
class NoauthProvider extends _$NoauthProvider {
  final _logger = getIt<TbLogger>();
  @override
  NoAuthState build() {
    return const NoAuthState();
  }

  Future<void> switchEndpoint(SwitchEndpointParams params) async {
    final secret = params.data.secret;
    final previousEndpoint = await getIt<IEndpointService>().getEndpoint();
    // Captured before anything is written: the rollback has to restore the
    // session of the host we came from, not just its endpoint (PROD-8200).
    final previousSession = await _readStoredSession();
    // Resolved inside the try: a malformed link has to end on the error screen
    // like any other failure instead of leaving the view on the spinner.
    String? host;

    try {
      host = _resolveHost(params.data, previousEndpoint);
      final isSameOrigin = _isSameOrigin(host, previousEndpoint);

      _logger.debug(
        'SwitchEndpointUseCase: host=$host previousEndpoint=$previousEndpoint '
        'isSameOrigin=$isSameOrigin hasSecret=${secret != null}',
      );

      if (secret == null || secret.isEmpty) {
        // A QR link without a secret (e.g. the mobile app QR shown on the
        // login page) cannot log the user in: just switch to the target host
        // and let the login page of that host take over.
        if (!isSameOrigin) {
          await _switchHostOnly(host: host, previousEndpoint: previousEndpoint);
        }
        state = const NoAuthState(isDone: true);
        return;
      }

      state = NoAuthState(step: NoAuthStep.fetchingSession, host: host);
      final session = await _exchangeSecret(host: host, secret: secret);
      await _verifySession(host: host, token: session.token);

      state = NoAuthState(
        step: isSameOrigin ? NoAuthStep.loggingIn : NoAuthStep.switchingHost,
        host: host,
      );
      await _installSession(
        session,
        host: host,
        previousEndpoint: previousEndpoint,
        isSameOrigin: isSameOrigin,
      );

      _logger.debug('SwitchEndpointUseCase: switch to $host done');
      state = const NoAuthState(isDone: true);
    } catch (e) {
      _logger.error('SwitchEndpointUseCase:catch $e', e);
      await _rollbackTo(previousEndpoint, previousSession);
      state = _failureState(e, host: host);
    }
  }

  /// Only http(s) links carry a host the app can switch to; anything else
  /// (e.g. a custom-scheme link) targets the current endpoint. `Uri.origin`
  /// still throws on an empty host, which the caller's catch turns into the
  /// regular error screen.
  String _resolveHost(SwitchEndpointArgs args, String previousEndpoint) {
    final uri = args.uri;

    return args.host ?? (_isHttpUri(uri) ? uri.origin : previousEndpoint);
  }

  /// Scheme and port are part of the identity: `http://acme.local:8080` and
  /// `https://acme.local` are different servers, so a link that differs only
  /// there still has to switch. `Uri.origin` normalizes case and default ports
  /// (`https://Acme.local:443/` still matches `https://acme.local`).
  ///
  /// Deliberately asymmetric: an unusable target throws and ends on the error
  /// screen, while an unusable stored endpoint (empty without the dart-define,
  /// or schemeless from an older build) is nothing to stay on, so the switch
  /// proceeds. `EndpointService.isCustomEndpoint` keeps comparing hosts only:
  /// Firebase is bound to the default host, not to a scheme or port.
  bool _isSameOrigin(String targetEndpoint, String previousEndpoint) {
    final target = Uri.parse(targetEndpoint).origin;
    final previous = Uri.tryParse(previousEndpoint);
    if (previous == null || !_isHttpUri(previous) || previous.host.isEmpty) {
      return false;
    }

    return target == previous.origin;
  }

  bool _isHttpUri(Uri uri) => uri.isScheme('http') || uri.isScheme('https');

  /// Exchanges the one-time QR secret for a JWT pair on the TARGET host.
  ///
  /// A raw Dio is used (instead of the typed
  /// `getQrCodeSettingsControllerApi().getUserTokenByMobileSecret`) because the
  /// request must hit [host], not the current client's endpoint.
  Future<_ExchangedSession> _exchangeSecret({
    required String host,
    required String secret,
  }) async {
    final Response<dynamic> response;
    try {
      response = await _hostClient(host).get('/api/noauth/qr/$secret');
    } on DioException catch (e) {
      // /api/noauth/** is permitAll on the server, so a 401 here can only be
      // the secret being rejected as unknown or expired.
      throw _asFailure(e, rejectedAs: NoAuthFailure.tokenExchangeFailed);
    }

    final data = response.data;
    final token = data is Map ? data['token'] as String? : null;
    if (token == null) {
      throw const SwitchEndpointFailure(NoAuthFailure.tokenExchangeFailed);
    }

    return (
      token: token,
      refreshToken: data is Map ? data['refreshToken'] as String? : null,
    );
  }

  /// The server can hand out an already-revoked pair: the pair is bound to the
  /// QR secret, so re-scanning the same code after a logout yields tokens
  /// issued before the logout watermark ('Token is outdated'). Verify against
  /// the target host BEFORE switching, otherwise the new client would enter a
  /// login/refresh loop it can never win.
  Future<void> _verifySession({
    required String host,
    required String token,
  }) async {
    try {
      await _hostClient(host).get(
        '/api/auth/user',
        options: Options(headers: {'X-Authorization': 'Bearer $token'}),
      );
    } on DioException catch (e) {
      throw _asFailure(e, rejectedAs: NoAuthFailure.sessionInvalid);
    }
  }

  /// Stages the exchanged pair in storage BEFORE re-creating the client: init
  /// logs in from storage, so this is what guarantees the new client starts
  /// with exactly these tokens instead of a session an earlier host left
  /// behind (PROD-8200).
  Future<void> _installSession(
    _ExchangedSession session, {
    required String host,
    required String previousEndpoint,
    required bool isSameOrigin,
  }) async {
    await _writeStoredSession(session);
    await getIt<IEndpointService>().setEndpoint(host);
    if (!isSameOrigin) {
      await _switchFirebaseApps(previousEndpoint);
    }
    await _reInitClient(host, logTag: 'switch');

    final client = getIt<ITbClientService>().client;
    if (!client.isAuthenticated()) {
      // Staging is the authoritative path; this only covers losing the race
      // with the outgoing client, whose failing background refresh clears the
      // shared storage before init() gets to read it.
      _logger.debug('SwitchEndpointUseCase: re-applying exchanged tokens');
      await client.setUserFromJwtToken(
        session.token,
        session.refreshToken,
        true,
      );
    }
  }

  Future<void> _switchHostOnly({
    required String host,
    required String previousEndpoint,
  }) async {
    state = NoAuthState(step: NoAuthStep.switchingHost, host: host);
    // A host switch without a login secret ends on the login page of the new
    // host: the previous host's session tokens are meaningless there.
    await getIt<ITbClientService>().client.setUserFromJwtToken(
      null,
      null,
      false,
    );
    await getIt<IEndpointService>().setEndpoint(host);
    await _switchFirebaseApps(previousEndpoint);
    await _reInitClient(host, logTag: 'hostOnly');
  }

  Future<void> _switchFirebaseApps(String previousEndpoint) async {
    _logger.debug('SwitchEndpointUseCase:deleteFB App');
    if (Firebase.apps.isNotEmpty) {
      getIt<IFirebaseService>()
        ..removeApp()
        ..removeApp(name: previousEndpoint);
    }

    // If we revert to the original host configured in the app_constants
    final isCustom = await getIt<IEndpointService>().isCustomEndpoint();
    if (!isCustom) {
      await _initDefaultFbApp();
    }
  }

  Future<void> _initDefaultFbApp() async {
    try {
      await getIt<IFirebaseService>().initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      //Ignore this error if fcm is not configured
      if (e is! UnsupportedError) {
        rethrow;
      }
    }
  }

  /// Rolls the app back to the endpoint and the session that were active
  /// before the failed switch, so a logged-in user keeps their session.
  Future<void> _rollbackTo(
    String previousEndpoint,
    _Session previousSession,
  ) async {
    try {
      await _writeStoredSession(previousSession);
      await getIt<IEndpointService>().setEndpoint(previousEndpoint);
      await getIt<IFirebaseService>().clearApps();
      final isCustom = await getIt<IEndpointService>().isCustomEndpoint();
      if (!isCustom) {
        await _initDefaultFbApp();
      }
      await _reInitClient(previousEndpoint, logTag: 'rollback');
    } catch (e) {
      _logger.error('SwitchEndpointUseCaseRollback:onError $e');
    }
  }

  Future<void> _reInitClient(String endpoint, {required String logTag}) {
    return getIt<ITbClientService>().reInit(
      endpoint: endpoint,
      onDone: () => ref.invalidate(oauthProvider),
      onAuthError: (e) {
        // Client-level errors are surfaced by the client service itself;
        // throwing here would escape the callback as an unhandled zone error
        // and leak a raw stacktrace to the UI (PROD-8200).
        _logger.error('SwitchEndpointUseCase:$logTag onAuthError $e');
      },
    );
  }

  Dio _hostClient(String host) => Dio(
    BaseOptions(
      baseUrl: host,
      connectTimeout: _hostRequestTimeout,
      receiveTimeout: _hostRequestTimeout,
    ),
  );

  Future<_Session> _readStoredSession() async {
    final storage = getIt<TbStorage>();
    return (
      token: await storage.getItem(_jwtTokenStorageKey) as String?,
      refreshToken: await storage.getItem(_refreshTokenStorageKey) as String?,
    );
  }

  Future<void> _writeStoredSession(_Session session) async {
    final storage = getIt<TbStorage>();
    await _writeStorageItem(storage, _jwtTokenStorageKey, session.token);
    await _writeStorageItem(
      storage,
      _refreshTokenStorageKey,
      session.refreshToken,
    );
  }

  Future<void> _writeStorageItem(
    TbStorage storage,
    String key,
    String? value,
  ) async {
    if (value != null) {
      await storage.setItem(key, value);
    } else {
      await storage.deleteItem(key);
    }
  }

  /// No response at all is a transport failure and says nothing about the QR
  /// session. A 401 is the server rejecting the secret or the pair (it maps
  /// JWT_TOKEN_EXPIRED to 401) and becomes [rejectedAs]; any other answer is
  /// left to the server's own message.
  SwitchEndpointFailure _asFailure(
    DioException e, {
    required NoAuthFailure rejectedAs,
  }) {
    final response = e.response;
    if (response == null) {
      return SwitchEndpointFailure(
        NoAuthFailure.connectionFailed,
        cause: e.type,
      );
    }

    final body = response.data;
    return SwitchEndpointFailure(
      response.statusCode == 401 ? rejectedAs : NoAuthFailure.unknown,
      serverMessage: body is Map ? body['message'] as String? : null,
      status: response.statusCode,
      cause: e.type,
    );
  }

  NoAuthState _failureState(Object error, {required String? host}) {
    if (error is SwitchEndpointFailure) {
      return NoAuthState(
        host: host,
        failure: error.failure,
        serverMessage: error.serverMessage,
      );
    }

    return NoAuthState(
      host: host,
      failure: NoAuthFailure.unknown,
      // Only the message is ever handed to the UI: ThingsboardError.toString()
      // embeds the captured stacktrace (PROD-8200).
      serverMessage: error is ThingsboardError ? error.message : null,
    );
  }
}

class NoAuthState {
  const NoAuthState({
    this.isDone = false,
    this.step,
    this.host,
    this.failure,
    this.serverMessage,
  });

  final bool isDone;
  final NoAuthStep? step;
  final String? host;
  final NoAuthFailure? failure;

  /// Message returned by the server, if any. It is hardcoded English on the
  /// server side, so the view prefers localized copy for the failures it can
  /// classify and shows this only for [NoAuthFailure.unknown].
  final String? serverMessage;
}
