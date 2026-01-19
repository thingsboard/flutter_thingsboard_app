import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
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

final class SwitchEndpointParams {
  const SwitchEndpointParams({required this.data});

  final SwitchEndpointArgs data;
}

@riverpod
class NoauthProvider extends _$NoauthProvider {
  final _logger = getIt<TbLogger>();
  @override
  NoAuthState build() {
    return NoAuthState(error: null, isDone: false, message: '');
  }

  Future<void> switchEndpoint(SwitchEndpointParams params) async {
    final _client = getIt<ITbClientService>().client;
    try {
      final uri = params.data.uri;
      final host = params.data.host ?? uri.origin;
      final key = params.data.secret;
      final currentEndpoint = await getIt<IEndpointService>().getEndpoint();
      final isTheSameHost =
          Uri.parse(host).host.compareTo(Uri.parse(currentEndpoint).host) == 0;

      state = NoAuthState(
        error: null,
        isDone: false,
        message: 'Getting data from your host $host',
      );

      final data = await _client.getLoginDataBySecretKey(host: host, key: key);

      final authUserFromJwt = _client.getAuthUserFromJwt(data.token);
      final currentlyAuthUser = _client.getAuthUser();
      // if (_client.isAuthenticated()) {
      //   state = NoAuthState(
      //     error: null,
      //     isDone: false,
      //     message: 'Logging you out ...',
      //   );
      //   await ref.read(loginProvider.notifier).logout();
      //   print('noath logout');
      // }

      if (isTheSameHost) {
        state = NoAuthState(
          error: null,
          isDone: false,
          message: 'Logging you into the host $host',
        );
      } else {
        state = NoAuthState(
          error: null,
          isDone: false,
          message: 'Switching you to the new host $host',
        );
      }

      await getIt<ITbClientService>().client.setUserFromJwtToken(
        data.token,
        data.refreshToken,
        false,
      );
      await getIt<IEndpointService>().setEndpoint(host);

      if (!isTheSameHost) {
        _logger.debug('SwitchEndpointUseCase:deleteFB App');
        if (Firebase.apps.isNotEmpty) {
          getIt<IFirebaseService>()
            ..removeApp()
            ..removeApp(name: currentEndpoint);
        }

        // If we revert to the original host configured in the app_constants
        final t = await getIt<IEndpointService>().isCustomEndpoint();
        _logger.debug(t);
        if (!t) {
          await _initDefaultFbApp();
        }
      }

      // A re-initialization is required if we set 'notifyUser' to true for
      // 'setUserFromJwtToken'. This code will be executed twice.
      await getIt<ITbClientService>().reInit(
        endpoint: host,
        onDone: ()  {
          ref.invalidate(oauthProvider);
          //  await ref.read(loginProvider.notifier).handleUserLoaded();
        },
        onAuthError: (e) {
          _logger.error('SwitchEndpointUseCase:onError $e');
          throw e;
        },
      );
      state = NoAuthState(error: null, isDone: true, message: '');
    } catch (e) {
      await reset(params);
      if (e is ThingsboardError) {
        _logger.error('SwitchEndpointUseCase:ThingsboardError $e', e);
        state = NoAuthState(
          error: e,
          isDone: false,
          message: e.message ?? e.toString(),
        );
        return;
      }
      _logger.error('SwitchEndpointUseCase:catch $e', e);
      state = NoAuthState(error: e, isDone: false, message: e.toString());
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

  Future<void> reset(SwitchEndpointParams params) async {
    try {
      await getIt<IEndpointService>().setEndpoint(
        ThingsboardAppConstants.thingsBoardApiEndpoint,
      );
      await getIt<IFirebaseService>().clearApps();
      await _initDefaultFbApp();
      _reInitClient(
        endpoint: ThingsboardAppConstants.thingsBoardApiEndpoint,
        params: params,
      );
    } catch (e) {
      _logger.error('SwitchEndpointUseCaseReset:onError $e');
    }
  }

  Future _reInitClient({
    required String endpoint,
    required SwitchEndpointParams params,
  }) async {
    await getIt<ITbClientService>().reInit(
      endpoint: endpoint,
      onDone: () {},
      onAuthError: (e) {
        _logger.error('SwitchEndpointUseCase:onError $e');
        throw e;
      },
    );
  }
}

class NoAuthState {
  NoAuthState({
    required this.error,
    required this.isDone,
    required this.message,
  });
  final dynamic error;
  final bool isDone;
  final String message;
}
