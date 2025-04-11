import 'package:thingsboard_app/constants/enviroment_variables.dart';

abstract class ThingsboardAppConstants {
  static const thingsBoardApiEndpoint = EnvironmentVariables.endpoint;
  static const thingsboardOAuth2CallbackUrlScheme = 'org.thingsboard.app.auth';

  static const thingsboardIOSAppSecret = EnvironmentVariables.iOSAppSecret;
  static const thingsboardAndroidAppSecret =
      EnvironmentVariables.androidAppSecret;
}
