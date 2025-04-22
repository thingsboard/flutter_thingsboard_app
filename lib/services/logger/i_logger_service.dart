abstract interface class ILoggerService {
  void trace(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void warn(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]);
}
