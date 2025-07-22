import 'package:flutter/material.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

extension AlarmSeverityColors on AlarmSeverity {
  Color toColor() {
    return switch (this) {
      AlarmSeverity.CRITICAL => const Color(0xFFD12730),

      AlarmSeverity.MAJOR => const Color(0xFFF66716),

      AlarmSeverity.MINOR => const Color(0xFFF2DA05),

      AlarmSeverity.WARNING => const Color(0xFFFAA405),

      AlarmSeverity.INDETERMINATE => Colors.black.withValues(alpha: 0.38),
    };
  }
}
