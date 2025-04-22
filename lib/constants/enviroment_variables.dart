abstract final class EnvironmentVariables {
  static const apiCalls = bool.fromEnvironment(
    'API_CALLS',
    defaultValue: false,
  );
  static const verbose = bool.fromEnvironment(
    'VERBOSE',
    defaultValue: false,
  );
  static const endpoint = String.fromEnvironment(
    'ENDPOINT',
    defaultValue: 'http://localhost:8080',
  );
  static const iOSAppSecret = String.fromEnvironment(
    'IOS_APP_SECRET',
    defaultValue: 'Your app secret here',
  );
  static const androidAppSecret = String.fromEnvironment(
    'ANDROID_APP_SECRET',
    defaultValue: 'Your app secret here',
  );
}
