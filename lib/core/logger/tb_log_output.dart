import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class TbLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      debugPrint(line);
    }
  }
}
