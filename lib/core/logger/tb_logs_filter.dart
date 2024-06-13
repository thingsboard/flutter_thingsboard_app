import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class TbLogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kReleaseMode) {
      return event.level.index >= Level.warning.index;
    } else {
      return true;
    }
  }
}
