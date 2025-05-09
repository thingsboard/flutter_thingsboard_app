import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/themes/tb_theme_utils.dart';
import 'package:thingsboard_app/config/themes/wl_theme_widget.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/region.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';

const DEFAULT_LOGO_URL = 'LOGO-PE';

class WlService {
  static final _defaultWLParams = _createDefaultWlParams();
  static final _defaultThemeData =
      TbThemeUtils.createTheme(_defaultWLParams.paletteSettings);

  static final _defaultLoginWlParams = _createDefaultLoginWlParams();
  static final _defaultLoginThemeData =
      TbThemeUtils.createTheme(_defaultLoginWlParams.paletteSettings);

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
        logoImageUrl: DEFAULT_LOGO_URL,
        logoImageHeight: 36,
        appTitle: 'ThingsBoard PE',
        favicon: Favicon(url: 'thingsboard.ico'),
        paletteSettings: PaletteSettings(
          primaryPalette: Palette(type: 'tb-primary'),
          accentPalette: Palette(type: 'tb-accent'),
        ),
        helpLinkBaseUrl: 'https://thingsboard.io',
        enableHelpLinks: true,
        showNameVersion: false,
        platformName: 'ThingsBoard',
        platformVersion: '3.4.1PE',
      );

  static LoginWhiteLabelingParams _createDefaultLoginWlParams() {
    var loginWlParams =
        LoginWhiteLabelingParams.fromJson(_defaultWLParams.toJson());
    loginWlParams.logoImageHeight = 50;
    loginWlParams.pageBackgroundColor = '#eee';
    loginWlParams.darkForeground = false;
    return loginWlParams;
  }

  static T _mergeDefaults<T extends WhiteLabelingParams>(
    bool isLogin,
    T? wlParams,
    T? targetDefaultWlParams,
  ) {
    if (targetDefaultWlParams == null) {
      if (isLogin) {
        targetDefaultWlParams = _defaultLoginWlParams as T;
      } else {
        targetDefaultWlParams = _defaultWLParams as T;
      }
    }
    if (wlParams == null) {
      if (isLogin) {
        wlParams = LoginWhiteLabelingParams(baseUrl: '') as T;
      } else {
        wlParams = WhiteLabelingParams() as T;
      }
    }

    if (isLogin) {
      var loginWlParams = wlParams as LoginWhiteLabelingParams;
      var targetDefaultLoginWlParams =
          targetDefaultWlParams as LoginWhiteLabelingParams;
      if (loginWlParams.pageBackgroundColor == null &&
          targetDefaultLoginWlParams.pageBackgroundColor != null) {
        loginWlParams.pageBackgroundColor =
            targetDefaultLoginWlParams.pageBackgroundColor;
      }
    }
    if (_isEmpty(wlParams.logoImageUrl)) {
      wlParams.logoImageUrl = targetDefaultWlParams.logoImageUrl;
    }
    wlParams.logoImageHeight ??= targetDefaultWlParams.logoImageHeight;
    if (_isEmpty(wlParams.appTitle)) {
      wlParams.appTitle = targetDefaultWlParams.appTitle;
    }
    if (wlParams.favicon == null || _isEmpty(wlParams.favicon?.url)) {
      wlParams.favicon = targetDefaultWlParams.favicon;
    }
    if (wlParams.paletteSettings == null) {
      wlParams.paletteSettings = targetDefaultWlParams.paletteSettings;
    } else {
      if (wlParams.paletteSettings?.primaryPalette == null ||
          _isEmpty(wlParams.paletteSettings?.primaryPalette?.type)) {
        wlParams.paletteSettings?.primaryPalette =
            targetDefaultWlParams.paletteSettings?.primaryPalette;
      }
      if (wlParams.paletteSettings?.accentPalette == null ||
          _isEmpty(wlParams.paletteSettings?.accentPalette?.type)) {
        wlParams.paletteSettings?.accentPalette =
            targetDefaultWlParams.paletteSettings?.accentPalette;
      }
    }
    if (_isEmpty(wlParams.helpLinkBaseUrl) &&
        !_isEmpty(targetDefaultWlParams.helpLinkBaseUrl)) {
      wlParams.helpLinkBaseUrl = targetDefaultWlParams.helpLinkBaseUrl;
    }
    if (wlParams.enableHelpLinks == null &&
        targetDefaultWlParams.enableHelpLinks != null) {
      wlParams.enableHelpLinks = targetDefaultWlParams.enableHelpLinks;
    }
    wlParams.showNameVersion ??= targetDefaultWlParams.showNameVersion;
    wlParams.platformName ??= targetDefaultWlParams.platformName;
    wlParams.platformVersion ??= targetDefaultWlParams.platformVersion;
    return wlParams;
  }

  static bool _isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static bool _wlIsEqual<T extends WhiteLabelingParams>(T? current, T target) {
    if (current == null) {
      return false;
    } else {
      return current.toJson().toString() == target.toJson().toString();
    }
  }

  final TbContext _tbContext;

  bool _isUserWlMode = false;

  LoginWhiteLabelingParams? _loginWlParams;
  Widget? _loginLogo;
  ThemeData? _loginThemeData;

  WhiteLabelingParams? _wlParams;
  Widget? _logo;
  ThemeData? _themeData;

  factory WlService(TbContext tbContext) {
    return WlService._internal(tbContext);
  }

  WlService._internal(this._tbContext);

  Future<void> updateWhiteLabeling() async {
    if (_tbContext.isAuthenticated) {
      await _loadUserWhiteLabelingParams();
    } else {
      await _loadLoginWhiteLabelingParams();
    }
  }

  WhiteLabelingParams get wlParams => _isUserWlMode
      ? (_wlParams ?? _defaultWLParams)
      : (_loginWlParams ?? _defaultLoginWlParams);

  ThemeData get themeData => _isUserWlMode
      ? (_themeData ?? _defaultThemeData)
      : (_loginThemeData ?? _defaultLoginThemeData);

  Widget get logoImage => (_isUserWlMode ? _logo : _loginLogo) ?? _defaultLogo;

  Widget? get loginLogoImage => _loginLogo ?? _defaultLoginLogo;

  Widget? get userLogoImage => _logo ?? _defaultLogo;

  bool? get loginShowNameVersion => _loginWlParams?.showNameVersion;

  bool? get showNameBottom => _loginWlParams?.showNameBottom;

  bool? get showNameVersion => _isUserWlMode
      ? _wlParams?.showNameVersion
      : _loginWlParams?.showNameVersion;

  String get platformName =>
      (_isUserWlMode
          ? _wlParams?.platformName
          : _loginWlParams?.platformName) ??
      '';

  String get platformVersion =>
      (_isUserWlMode
          ? _wlParams?.platformVersion
          : _loginWlParams?.platformVersion) ??
      '';

  String get platformNameAndVersion => '$platformName v.$platformVersion';

  bool get isCustomLogo => _isUserWlMode
      ? _wlParams != null && _wlParams?.logoImageUrl != DEFAULT_LOGO_URL
      : _loginWlParams != null &&
          _loginWlParams?.logoImageUrl != DEFAULT_LOGO_URL;

  Future<void> _loadLoginWhiteLabelingParams() async {
    var loginWlParams = await _tbContext.tbClient
        .getWhiteLabelingService()
        .getLoginWhiteLabelParams();
    if (loginWlParams.platformVersion == null) {
      var platformVersion = _tbContext.tbClient.getPlatformVersion();
      if (platformVersion != null) {
        loginWlParams.platformVersion = platformVersion.versionString();
      }
    }
    loginWlParams = _mergeDefaults(true, loginWlParams, _defaultLoginWlParams);
    bool loginWlChanged = false;
    if (!_wlIsEqual(_loginWlParams, loginWlParams)) {
      _loginWlParams = loginWlParams;
      _loginThemeData =
          TbThemeUtils.createTheme(_loginWlParams!.paletteSettings);
      await _updateImages(
        _tbContext.currentState!.context,
        _tbContext.tbClient,
        _loginWlParams!,
        _loginThemeData!,
        true,
      );
      loginWlChanged = true;
    }
    if (loginWlChanged || _isUserWlMode) {
      _isUserWlMode = false;
      WlThemeWidget.of(_tbContext.currentState!.context)!.wlUpdated();
    }
  }

  Future<void> _loadUserWhiteLabelingParams() async {
    var userWlParams = await _tbContext.tbClient
        .getWhiteLabelingService()
        .getWhiteLabelParams();
    if (userWlParams.platformVersion == null) {
      var platformVersion = _tbContext.tbClient.getPlatformVersion();
      if (platformVersion != null) {
        userWlParams.platformVersion = platformVersion.versionString();
      }
    }
    userWlParams = _mergeDefaults(false, userWlParams, _defaultWLParams);
    bool userWlChanged = false;
    if (!_wlIsEqual(_wlParams, userWlParams)) {
      _wlParams = userWlParams;
      _themeData = TbThemeUtils.createTheme(_wlParams!.paletteSettings);
      await _updateImages(
        _tbContext.currentState!.context,
        _tbContext.tbClient,
        _wlParams!,
        _themeData!,
        false,
      );
      userWlChanged = true;
    }
    if (userWlChanged || !_isUserWlMode) {
      _isUserWlMode = true;
      WlThemeWidget.of(_tbContext.currentState!.context)!.wlUpdated();
    }
  }

  Future<void> _updateImages(
    BuildContext context,
    ThingsboardClient tbClient,
    WhiteLabelingParams wlParams,
    ThemeData themeData,
    bool isLogin,
  ) async {
    Widget image;
    double height = wlParams.logoImageHeight!.toDouble() / 3 * 2;
    if (wlParams.logoImageUrl == DEFAULT_LOGO_URL) {
      Region? region;

      image = SvgPicture.asset(
        region == Region.europe
            ? ThingsboardImage.thingsBoardEUWithTitle
            : ThingsboardImage.thingsBoardWithTitle,
        height: height,
        colorFilter: ColorFilter.mode(themeData.primaryColor, BlendMode.srcIn),
        semanticsLabel: 'ThingsBoard Logo',
      );
    } else {
      image = Utils.imageFromTbImage(
        context,
        tbClient,
        wlParams.logoImageUrl!,
        height: height,
        semanticLabel: 'ThingsBoard Logo',
        loginLogo: isLogin,
      );
    }
    if (isLogin) {
      _loginLogo = image;
    } else {
      _logo = image;
    }
  }
}
