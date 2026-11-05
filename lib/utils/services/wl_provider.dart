// ignore_for_file: parameter_assignments

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/config/themes/tb_theme_utils.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/login_theme.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_app/utils/utils.dart';
part 'wl_provider.g.dart';
part 'wl_provider.freezed.dart';

const defaultLogoUrl = 'LOGO-PE';
const wlPollInterval = Duration(hours: 1);
const wlFetchTimeout = Duration(seconds: 30);

@freezed
abstract class WlState with _$WlState {
  const factory WlState({
    required LoginWhiteLabelingParams loginWhiteLabelingParams,
    required WhiteLabelingParams userParams,
    required ThemeData theme,

    /// The login page look, built from the login white-labeling. Kept apart
    /// from [theme] so the login page shown right after a logout does not
    /// inherit the signed-out user's palette.
    required ThemeData loginTheme,
    required bool isUserWlMode,
    required Widget logo,
  }) = _WlState;
  const WlState._();

  WhiteLabelingParams get wlParams =>
      isUserWlMode ? userParams : _loginToWlParams(loginWhiteLabelingParams);

  bool? get loginShowNameVersion => loginWhiteLabelingParams.showNameVersion;

  bool? get showNameBottom => loginWhiteLabelingParams.showNameBottom;

  bool? get showNameVersion =>
      isUserWlMode
          ? userParams.showNameVersion
          : loginWhiteLabelingParams.showNameVersion;

  String get platformName =>
      (isUserWlMode
          ? userParams.platformName
          : loginWhiteLabelingParams.platformName) ??
      '';

  String get platformVersion =>
      (isUserWlMode
          ? userParams.platformVersion
          : loginWhiteLabelingParams.platformVersion) ??
      '';

  String get platformNameAndVersion => [
    if (platformName.isNotEmpty) platformName,
    if (platformVersion.isNotEmpty) 'v.$platformVersion',
  ].join(' ');

  bool get isCustomLogo =>
      isUserWlMode
          ? userParams.logoImageUrl != defaultLogoUrl
          : loginWhiteLabelingParams.logoImageUrl != defaultLogoUrl;
}

WhiteLabelingParams _loginToWlParams(LoginWhiteLabelingParams p) =>
    WhiteLabelingParams(
      (b) =>
          b
            ..logoImageUrl = p.logoImageUrl
            ..logoImageHeight = p.logoImageHeight
            ..appTitle = p.appTitle
            ..favicon = p.favicon?.toBuilder()
            ..paletteSettings = p.paletteSettings?.toBuilder()
            ..helpLinkBaseUrl = p.helpLinkBaseUrl
            ..uiHelpBaseUrl = p.uiHelpBaseUrl
            ..enableHelpLinks = p.enableHelpLinks
            ..whiteLabelingEnabled = p.whiteLabelingEnabled
            ..showNameVersion = p.showNameVersion
            ..platformName = p.platformName
            ..platformVersion = p.platformVersion
            ..customCss = p.customCss
            ..hideConnectivityDialog = p.hideConnectivityDialog
            ..overrideTrendzName = p.overrideTrendzName,
    );

@riverpod
class Wl extends _$Wl {
  // Read the live client on every access: a QR-code login re-creates the
  // client (ITbClientService.reInit), so an instance captured at build time
  // would keep the pre-login token state and fail with 'Unauthorized!'
  // (PROD-8879).
  ThingsboardClient get _tbClient => getIt<ITbClientService>().client;
  late ProviderSubscription<LoginState> _subscription;
  late AppLifecycleListener _lifecycleListener;
  Timer? _pollTimer;
  bool _isFetchInFlight = false;

  // Only the latest fetch may write state: a timed-out poll keeps running and
  // could otherwise land after a newer fetch and bring back the older look.
  int _fetchId = 0;

  // The last params turned into theme and logo, so a poll that returns the
  // same params skips the rebuild of the whole MaterialApp. Login and user
  // params are different types, so switching mode always re-applies.
  Object? _appliedParams;

  @override
  WlState build() {
    _subscription = ref.listen(loginProvider, (prev, next) {
      updateWhiteLabeling();
    });
    // The server has no push channel for white-labeling changes, so they are
    // fetched when the app comes back to the foreground, with a rare poll as
    // a fallback for an app that stays open (PROD-8928).
    _startPolling();
    _lifecycleListener = AppLifecycleListener(
      onShow: _resumePolling,
      onHide: _stopPolling,
    );
    ref.onDispose(() {
      _subscription.close();
      _stopPolling();
      _lifecycleListener.dispose();
    });
    return WlState(
      loginWhiteLabelingParams: _defaultLoginWlParams,
      userParams: _defaultWLParams,
      theme: _defaultThemeData,
      loginTheme: _defaultLoginTheme,
      isUserWlMode: false,
      logo: _defaultLogo,
    );
  }

  static final _defaultWLParams = _createDefaultWlParams();
  static final _defaultThemeData = tbTheme(
    TbThemeUtils.tbPrimary,
    TbThemeUtils.tbPrimaryColor,
    TbThemeUtils.tbAccentColor,
  );
  static final _defaultLoginWlParams = _createDefaultLoginWlParams();
  static final _defaultLoginTheme = loginPageTheme(
    _defaultThemeData,
    darkForeground: false,
  );

  static final _defaultLogo = SvgPicture.asset(
    ThingsboardImage.thingsBoardWithTitle,
    height: 36 / 3 * 2,
    colorFilter: ColorFilter.mode(TbThemeUtils.tbPrimary, BlendMode.srcIn),
    semanticsLabel: 'ThingsBoard Logo',
  );

  static final _defaultLoginLogo = SvgPicture.asset(
    ThingsboardImage.thingsBoardWithTitle,
    height: 50 / 3 * 2,
    colorFilter: ColorFilter.mode(TbThemeUtils.tbPrimary, BlendMode.srcIn),
    semanticsLabel: 'ThingsBoard Logo',
  );

  static WhiteLabelingParams _createDefaultWlParams() => WhiteLabelingParams(
    (b) =>
        b
          ..logoImageUrl = defaultLogoUrl
          ..logoImageHeight = 36
          ..appTitle = 'ThingsBoard PE'
          ..favicon = (FaviconBuilder()..url = 'thingsboard.ico')
          ..paletteSettings =
              (PaletteSettingsBuilder()
                ..primaryPalette =
                    (PaletteBuilder()
                      ..type = 'tb-primary') // translate-me-ignore
                ..accentPalette =
                    (PaletteBuilder()
                      ..type = 'tb-accent')) // translate-me-ignore
          ..helpLinkBaseUrl = 'https://thingsboard.io'
          ..enableHelpLinks = true
          ..showNameVersion = false
          ..platformName = 'ThingsBoard',
  );

  static LoginWhiteLabelingParams _createDefaultLoginWlParams() {
    // Build login WL params from default WL params values
    return LoginWhiteLabelingParams(
      (b) =>
          b
            ..logoImageUrl = defaultLogoUrl
            ..logoImageHeight = 50
            ..appTitle = 'ThingsBoard PE'
            ..favicon = (FaviconBuilder()..url = 'thingsboard.ico')
            ..paletteSettings =
                (PaletteSettingsBuilder()
                  ..primaryPalette =
                      (PaletteBuilder()
                        ..type = 'tb-primary') // translate-me-ignore
                  ..accentPalette =
                      (PaletteBuilder()
                        ..type = 'tb-accent')) // translate-me-ignore
            ..helpLinkBaseUrl = 'https://thingsboard.io'
            ..enableHelpLinks = true
            ..showNameVersion = false
            ..platformName = 'ThingsBoard'
            ..pageBackgroundColor = '#eee'
            ..darkForeground = false,
    );
  }

  /// Merges [wlParams] with [defaultWlParams], filling in missing fields from
  /// defaults. Returns a new immutable instance (built_value rebuild).
  static WhiteLabelingParams _mergeDefaults(
    WhiteLabelingParams? wlParams,
    WhiteLabelingParams defaultWlParams,
  ) {
    wlParams ??= WhiteLabelingParams((b) => b);
    return wlParams.rebuild((b) {
      if (_isEmpty(b.logoImageUrl)) {
        b.logoImageUrl = defaultWlParams.logoImageUrl;
      }
      b.logoImageHeight ??= defaultWlParams.logoImageHeight;
      if (_isEmpty(b.appTitle)) b.appTitle = defaultWlParams.appTitle;
      if (b.favicon == null || _isEmpty(b.favicon?.url)) {
        b.favicon =
            defaultWlParams.favicon?.toBuilder() ??
            (FaviconBuilder()..url = '');
      }
      if (b.paletteSettings == null) {
        b.paletteSettings =
            defaultWlParams.paletteSettings?.toBuilder() ??
            PaletteSettingsBuilder();
      } else {
        if (b.paletteSettings!.primaryPalette == null ||
            _isEmpty(b.paletteSettings!.primaryPalette?.type)) {
          b.paletteSettings!.primaryPalette =
              defaultWlParams.paletteSettings?.primaryPalette?.toBuilder() ??
              (PaletteBuilder()..type = '');
        }
        if (b.paletteSettings!.accentPalette == null ||
            _isEmpty(b.paletteSettings!.accentPalette?.type)) {
          b.paletteSettings!.accentPalette =
              defaultWlParams.paletteSettings?.accentPalette?.toBuilder() ??
              (PaletteBuilder()..type = '');
        }
      }
      if (_isEmpty(b.helpLinkBaseUrl) &&
          !_isEmpty(defaultWlParams.helpLinkBaseUrl)) {
        b.helpLinkBaseUrl = defaultWlParams.helpLinkBaseUrl;
      }
      b.enableHelpLinks ??= defaultWlParams.enableHelpLinks;
      b.showNameVersion ??= defaultWlParams.showNameVersion;
      b.platformName ??= defaultWlParams.platformName;
      b.platformVersion ??= defaultWlParams.platformVersion;
    });
  }

  static LoginWhiteLabelingParams _mergeLoginDefaults(
    LoginWhiteLabelingParams? wlParams,
    LoginWhiteLabelingParams defaultWlParams,
  ) {
    wlParams ??= LoginWhiteLabelingParams((b) => b);
    // Convert to WhiteLabelingParams to reuse common merge logic, then copy
    // the login-specific fields back.
    final baseWl = _loginToWlParams(wlParams);
    final defaultBaseWl = _loginToWlParams(defaultWlParams);
    final mergedBase = _mergeDefaults(baseWl, defaultBaseWl);
    return LoginWhiteLabelingParams(
      (b) =>
          b
            ..logoImageUrl = mergedBase.logoImageUrl
            ..logoImageHeight = mergedBase.logoImageHeight
            ..appTitle = mergedBase.appTitle
            ..favicon = mergedBase.favicon?.toBuilder()
            ..paletteSettings = mergedBase.paletteSettings?.toBuilder()
            ..helpLinkBaseUrl = mergedBase.helpLinkBaseUrl
            ..enableHelpLinks = mergedBase.enableHelpLinks
            ..showNameVersion = mergedBase.showNameVersion
            // Left unset, the web login fills these from its own bundle, which
            // the app cannot; only values the admin typed in are shown.
            ..platformName = wlParams!.platformName
            ..platformVersion = wlParams.platformVersion
            ..pageBackgroundColor =
                wlParams.pageBackgroundColor ??
                defaultWlParams.pageBackgroundColor
            ..darkForeground =
                wlParams.darkForeground ?? defaultWlParams.darkForeground
            ..showNameBottom =
                wlParams.showNameBottom ?? defaultWlParams.showNameBottom
            ..domainId = wlParams.domainId?.toBuilder()
            ..baseUrl = wlParams.baseUrl
            ..prohibitDifferentUrl = wlParams.prohibitDifferentUrl
            ..adminSettingsId = wlParams.adminSettingsId,
    );
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(wlPollInterval, (_) => _poll());
  }

  // Coming back to the app is when a change made in the web UI is most
  // likely to be looked for, so it is fetched right away rather than at the
  // next tick.
  void _resumePolling() {
    _startPolling();
    unawaited(_poll());
  }

  void _stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  // The client sets no receive timeout, so a request that stalls after
  // connecting would otherwise keep the in-flight guard set and end polling
  // for the rest of the session.
  Future<void> _poll() async {
    if (_isFetchInFlight) return;
    _isFetchInFlight = true;
    try {
      await updateWhiteLabeling().timeout(wlFetchTimeout);
    } catch (e, s) {
      getIt<TbLogger>().debug('White-labeling poll failed', e, s);
    } finally {
      _isFetchInFlight = false;
    }
  }

  static bool _isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static bool _wlIsEqual<T>(T? current, T target) {
    if (current == null) return false;
    return current == target;
  }

  Future<void> updateWhiteLabeling() async {
    final region = await getIt<ILocalDatabaseService>().getSelectedRegion();
    if (region == null && !ThingsboardAppConstants.ignoreRegionSelection) {
      return;
    }
    if (ref.read(loginProvider).isFullyAuthenticated()) {
      await _loadUserWhiteLabelingParams();
    } else {
      await loadLoginWhiteLabelingParams();
    }
  }

  Future<void> loadLoginWhiteLabelingParams({BuildContext? context}) async {
    final fetchId = ++_fetchId;
    final response =
        await _tbClient
            .getWhiteLabelingControllerApi()
            .getLoginWhiteLabelParams();
    var loginWlParams = response.data;
    var merged = _mergeLoginDefaults(loginWlParams, _defaultLoginWlParams);
    if (merged == _appliedParams) return;
    final loginThemeData = TbThemeUtils.createTheme(merged.paletteSettings);
    final loginLogo = await _updateImages(
      context ?? globalNavigatorKey.currentContext!,
      _tbClient,
      _loginToWlParams(merged),
      loginThemeData,
      true,
    );
    // A poll started before a login must not paint the login look over the
    // user white-labeling that the login listener applied meanwhile.
    if (ref.read(loginProvider).isFullyAuthenticated()) return;
    if (fetchId != _fetchId) return;
    state = state.copyWith(
      loginWhiteLabelingParams: merged,
      theme: loginThemeData,
      loginTheme: loginPageTheme(
        loginThemeData,
        darkForeground: merged.darkForeground ?? false,
      ),
      logo: loginLogo,
      isUserWlMode: false,
    );
    _appliedParams = merged;
  }

  Future<void> _loadUserWhiteLabelingParams() async {
    final fetchId = ++_fetchId;
    final response =
        await _tbClient.getWhiteLabelingControllerApi().getWhiteLabelParams();
    final merged = await _withServerVersion(
      _mergeDefaults(response.data, _defaultWLParams),
    );
    if (merged == _appliedParams) return;
    final themeData = TbThemeUtils.createTheme(merged.paletteSettings);
    final logo = await _updateImages(
      globalNavigatorKey.currentContext!,
      _tbClient,
      merged,
      themeData,
      false,
    );
    // The reverse of the check in loadLoginWhiteLabelingParams: a poll
    // started before a logout must not bring the user look back to the login
    // screen.
    if (!ref.read(loginProvider).isFullyAuthenticated()) return;
    if (fetchId != _fetchId) return;
    state = state.copyWith(
      userParams: merged,
      theme: themeData,
      logo: logo,
      isUserWlMode: true,
    );
    _appliedParams = merged;
  }

  // An unset platform version means "the running server version": the web UI
  // fills it from its own bundle, which the app cannot do, so it asks the
  // server. Both null and '' count as unset, as in the web: the admin form
  // stores '' when the field is cleared.
  Future<WhiteLabelingParams> _withServerVersion(
    WhiteLabelingParams params,
  ) async {
    if (!_isEmpty(params.platformVersion)) {
      return params;
    }
    final serverVersion = await _serverVersion();
    return serverVersion == null
        ? params
        : params.rebuild((b) => b..platformVersion = serverVersion);
  }

  // The version cannot change while the app talks to one server, and a
  // re-init (QR login, endpoint switch) hands out a new client, so one lookup
  // per client is enough. A failed lookup is retried on the next load.
  ThingsboardClient? _serverVersionClient;
  String? _serverVersionCache;

  Future<String?> _serverVersion() async {
    final client = _tbClient;
    if (_serverVersionCache != null &&
        identical(client, _serverVersionClient)) {
      return _serverVersionCache;
    }
    final version = await _fetchServerVersion(client);
    if (version != null) {
      _serverVersionClient = client;
      _serverVersionCache = version;
    }
    return version;
  }

  // The endpoint that reports the server version is hidden from the OpenAPI
  // spec, so the generated client has no accessor for it and it is requested
  // by path. The web UI shows the package version, which never carries the
  // Maven -SNAPSHOT suffix.
  Future<String?> _fetchServerVersion(ThingsboardClient client) async {
    try {
      final response = await client.get<Map<String, dynamic>>(
        '/api/system/info',
        options: Options(extra: silentRequestExtra()),
      );
      final version = response.data?['version'] as String?;
      return version?.replaceFirst(RegExp(r'-SNAPSHOT$'), '');
    } catch (e) {
      getIt<TbLogger>().debug('Server version lookup failed: $e');
      return null;
    }
  }

  Future<Widget> _updateImages(
    BuildContext context,
    ThingsboardClient tbClient,
    WhiteLabelingParams wlParams,
    ThemeData themeData,
    bool isLogin,
  ) async {
    final logoImageHeight = (wlParams.logoImageHeight ?? 36).toDouble();
    // The login logo matches the web, where the height is set in px; the app
    // bar logo keeps its smaller scale.
    final double height =
        isLogin ? logoImageHeight.clamp(1, 200) : logoImageHeight / 3 * 2;
    if (wlParams.logoImageUrl == defaultLogoUrl) {
      Region? region;
      return SvgPicture.asset(
        region == Region.europe
            ? ThingsboardImage.thingsBoardEUWithTitle
            : ThingsboardImage.thingsBoardWithTitle,
        height: height,
        colorFilter: ColorFilter.mode(themeData.primaryColor, BlendMode.srcIn),
        semanticsLabel: 'ThingsBoard Logo',
      );
    } else {
      return Utils.imageFromTbImage(
        context,
        tbClient,
        wlParams.logoImageUrl,
        height: height,
        semanticLabel: 'ThingsBoard Logo',
        loginLogo: isLogin,
      );
    }
  }
}
