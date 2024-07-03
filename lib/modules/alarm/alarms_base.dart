import 'package:flutter/material.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

const Map<AlarmSeverity, Color> alarmSeverityColors = {
  AlarmSeverity.CRITICAL: Color(0xFFFF0000),
  AlarmSeverity.MAJOR: Color(0xFFFFA500),
  AlarmSeverity.MINOR: Color(0xFFFFCA3D),
  AlarmSeverity.WARNING: Color(0xFFABAB00),
  AlarmSeverity.INDETERMINATE: Color(0xFF00FF00),
};

const Map<AlarmSeverity, String> alarmSeverityTranslations = {
  AlarmSeverity.CRITICAL: 'Critical',
  AlarmSeverity.MAJOR: 'Major',
  AlarmSeverity.MINOR: 'Minor',
  AlarmSeverity.WARNING: 'Warning',
  AlarmSeverity.INDETERMINATE: 'Indeterminate',
};

const Map<AlarmStatus, String> alarmStatusTranslations = {
  AlarmStatus.ACTIVE_ACK: 'Active Acknowledged',
  AlarmStatus.ACTIVE_UNACK: 'Active Unacknowledged',
  AlarmStatus.CLEARED_ACK: 'Cleared Acknowledged',
  AlarmStatus.CLEARED_UNACK: 'Cleared Unacknowledged',
};
