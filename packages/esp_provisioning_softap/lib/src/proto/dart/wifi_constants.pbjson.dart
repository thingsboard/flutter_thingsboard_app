///
//  Generated code. Do not modify.
//  source: wifi_constants.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use wifiStationStateDescriptor instead')
const WifiStationState$json = const {
  '1': 'WifiStationState',
  '2': const [
    const {'1': 'Connected', '2': 0},
    const {'1': 'Connecting', '2': 1},
    const {'1': 'Disconnected', '2': 2},
    const {'1': 'ConnectionFailed', '2': 3},
  ],
};

/// Descriptor for `WifiStationState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List wifiStationStateDescriptor = $convert.base64Decode('ChBXaWZpU3RhdGlvblN0YXRlEg0KCUNvbm5lY3RlZBAAEg4KCkNvbm5lY3RpbmcQARIQCgxEaXNjb25uZWN0ZWQQAhIUChBDb25uZWN0aW9uRmFpbGVkEAM=');
@$core.Deprecated('Use wifiConnectFailedReasonDescriptor instead')
const WifiConnectFailedReason$json = const {
  '1': 'WifiConnectFailedReason',
  '2': const [
    const {'1': 'AuthError', '2': 0},
    const {'1': 'NetworkNotFound', '2': 1},
  ],
};

/// Descriptor for `WifiConnectFailedReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List wifiConnectFailedReasonDescriptor = $convert.base64Decode('ChdXaWZpQ29ubmVjdEZhaWxlZFJlYXNvbhINCglBdXRoRXJyb3IQABITCg9OZXR3b3JrTm90Rm91bmQQAQ==');
@$core.Deprecated('Use wifiAuthModeDescriptor instead')
const WifiAuthMode$json = const {
  '1': 'WifiAuthMode',
  '2': const [
    const {'1': 'Open', '2': 0},
    const {'1': 'WEP', '2': 1},
    const {'1': 'WPA_PSK', '2': 2},
    const {'1': 'WPA2_PSK', '2': 3},
    const {'1': 'WPA_WPA2_PSK', '2': 4},
    const {'1': 'WPA2_ENTERPRISE', '2': 5},
  ],
};

/// Descriptor for `WifiAuthMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List wifiAuthModeDescriptor = $convert.base64Decode('CgxXaWZpQXV0aE1vZGUSCAoET3BlbhAAEgcKA1dFUBABEgsKB1dQQV9QU0sQAhIMCghXUEEyX1BTSxADEhAKDFdQQV9XUEEyX1BTSxAEEhMKD1dQQTJfRU5URVJQUklTRRAF');
@$core.Deprecated('Use wifiConnectedStateDescriptor instead')
const WifiConnectedState$json = const {
  '1': 'WifiConnectedState',
  '2': const [
    const {'1': 'ip4_addr', '3': 1, '4': 1, '5': 9, '10': 'ip4Addr'},
    const {'1': 'auth_mode', '3': 2, '4': 1, '5': 14, '6': '.WifiAuthMode', '10': 'authMode'},
    const {'1': 'ssid', '3': 3, '4': 1, '5': 12, '10': 'ssid'},
    const {'1': 'bssid', '3': 4, '4': 1, '5': 12, '10': 'bssid'},
    const {'1': 'channel', '3': 5, '4': 1, '5': 5, '10': 'channel'},
  ],
};

/// Descriptor for `WifiConnectedState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiConnectedStateDescriptor = $convert.base64Decode('ChJXaWZpQ29ubmVjdGVkU3RhdGUSGQoIaXA0X2FkZHIYASABKAlSB2lwNEFkZHISKgoJYXV0aF9tb2RlGAIgASgOMg0uV2lmaUF1dGhNb2RlUghhdXRoTW9kZRISCgRzc2lkGAMgASgMUgRzc2lkEhQKBWJzc2lkGAQgASgMUgVic3NpZBIYCgdjaGFubmVsGAUgASgFUgdjaGFubmVs');
