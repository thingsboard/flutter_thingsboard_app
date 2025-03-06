abstract final class EnvironmentVariables {
  static const apiCalls =
      bool.fromEnvironment('API_CALLS', defaultValue: false);
  static const verbose = bool.fromEnvironment('VERBOSE', defaultValue: false);
}
