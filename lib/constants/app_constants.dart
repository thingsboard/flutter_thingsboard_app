import 'package:thingsboard_app/modules/main/model/navigation_type.dart';

abstract final class ThingsboardAppConstants {
  static const thingsBoardApiEndpoint = String.fromEnvironment(
    'thingsboardApiEndpoint',
  );
  static const thingsboardOAuth2CallbackUrlScheme = String.fromEnvironment(
    'thingsboardOAuth2CallbackUrlScheme',
  );
  static const thingsboardIOSAppSecret = String.fromEnvironment(
    'thingsboardIosAppSecret',
  );
  static const thingsboardAndroidAppSecret = String.fromEnvironment(
    'thingsboardAndroidAppSecret',
  );
  static const ignoreRegionSelection = thingsBoardApiEndpoint != '';
  static final navigationType = 
  TbNavigationType.fromString(
  const String.fromEnvironment('navigationType'),
  );
}
