import 'package:logger/logger.dart';
import 'package:thingsboard_app/core/logger/tb_log_output.dart';
import 'package:thingsboard_app/core/logger/tb_logs_filter.dart';

class TbLogger {
  final _logger = Logger(
    filter: TbLogsFilter(),
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 0,
        lineLength: 200,
        colors: false,
      ),
    ),
    output: TbLogOutput(),
  );

  void trace(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
