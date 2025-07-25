abstract final class ThingsboardAppConstants {
  static const thingsBoardApiEndpoint = String.fromEnvironment('thingsboardApiEndpoint');
  static const thingsboardOAuth2CallbackUrlScheme = String.fromEnvironment('thingsboardOAuth2CallbackUrlScheme');
  static const thingsboardIOSAppSecret = String.fromEnvironment('thingsboardIOSAppSecret');
  static const thingsboardAndroidAppSecret = String.fromEnvironment('thingsboardAndroidAppSecret');
  static const ignoreRegionSelection = thingsBoardApiEndpoint != '';
}
