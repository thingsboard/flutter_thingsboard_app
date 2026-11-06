///
//  Generated code. Do not modify.
//  source: wifi_scan.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use wiFiScanMsgTypeDescriptor instead')
const WiFiScanMsgType$json = const {
  '1': 'WiFiScanMsgType',
  '2': const [
    const {'1': 'TypeCmdScanStart', '2': 0},
    const {'1': 'TypeRespScanStart', '2': 1},
    const {'1': 'TypeCmdScanStatus', '2': 2},
    const {'1': 'TypeRespScanStatus', '2': 3},
    const {'1': 'TypeCmdScanResult', '2': 4},
    const {'1': 'TypeRespScanResult', '2': 5},
  ],
};

/// Descriptor for `WiFiScanMsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List wiFiScanMsgTypeDescriptor = $convert.base64Decode('Cg9XaUZpU2Nhbk1zZ1R5cGUSFAoQVHlwZUNtZFNjYW5TdGFydBAAEhUKEVR5cGVSZXNwU2NhblN0YXJ0EAESFQoRVHlwZUNtZFNjYW5TdGF0dXMQAhIWChJUeXBlUmVzcFNjYW5TdGF0dXMQAxIVChFUeXBlQ21kU2NhblJlc3VsdBAEEhYKElR5cGVSZXNwU2NhblJlc3VsdBAF');
@$core.Deprecated('Use cmdScanStartDescriptor instead')
const CmdScanStart$json = const {
  '1': 'CmdScanStart',
  '2': const [
    const {'1': 'blocking', '3': 1, '4': 1, '5': 8, '10': 'blocking'},
    const {'1': 'passive', '3': 2, '4': 1, '5': 8, '10': 'passive'},
    const {'1': 'group_channels', '3': 3, '4': 1, '5': 13, '10': 'groupChannels'},
    const {'1': 'period_ms', '3': 4, '4': 1, '5': 13, '10': 'periodMs'},
  ],
};

/// Descriptor for `CmdScanStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdScanStartDescriptor = $convert.base64Decode('CgxDbWRTY2FuU3RhcnQSGgoIYmxvY2tpbmcYASABKAhSCGJsb2NraW5nEhgKB3Bhc3NpdmUYAiABKAhSB3Bhc3NpdmUSJQoOZ3JvdXBfY2hhbm5lbHMYAyABKA1SDWdyb3VwQ2hhbm5lbHMSGwoJcGVyaW9kX21zGAQgASgNUghwZXJpb2RNcw==');
@$core.Deprecated('Use respScanStartDescriptor instead')
const RespScanStart$json = const {
  '1': 'RespScanStart',
};

/// Descriptor for `RespScanStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respScanStartDescriptor = $convert.base64Decode('Cg1SZXNwU2NhblN0YXJ0');
@$core.Deprecated('Use cmdScanStatusDescriptor instead')
const CmdScanStatus$json = const {
  '1': 'CmdScanStatus',
};

/// Descriptor for `CmdScanStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdScanStatusDescriptor = $convert.base64Decode('Cg1DbWRTY2FuU3RhdHVz');
@$core.Deprecated('Use respScanStatusDescriptor instead')
const RespScanStatus$json = const {
  '1': 'RespScanStatus',
  '2': const [
    const {'1': 'scan_finished', '3': 1, '4': 1, '5': 8, '10': 'scanFinished'},
    const {'1': 'result_count', '3': 2, '4': 1, '5': 13, '10': 'resultCount'},
  ],
};

/// Descriptor for `RespScanStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respScanStatusDescriptor = $convert.base64Decode('Cg5SZXNwU2NhblN0YXR1cxIjCg1zY2FuX2ZpbmlzaGVkGAEgASgIUgxzY2FuRmluaXNoZWQSIQoMcmVzdWx0X2NvdW50GAIgASgNUgtyZXN1bHRDb3VudA==');
@$core.Deprecated('Use cmdScanResultDescriptor instead')
const CmdScanResult$json = const {
  '1': 'CmdScanResult',
  '2': const [
    const {'1': 'start_index', '3': 1, '4': 1, '5': 13, '10': 'startIndex'},
    const {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `CmdScanResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdScanResultDescriptor = $convert.base64Decode('Cg1DbWRTY2FuUmVzdWx0Eh8KC3N0YXJ0X2luZGV4GAEgASgNUgpzdGFydEluZGV4EhQKBWNvdW50GAIgASgNUgVjb3VudA==');
@$core.Deprecated('Use wiFiScanResultDescriptor instead')
const WiFiScanResult$json = const {
  '1': 'WiFiScanResult',
  '2': const [
    const {'1': 'ssid', '3': 1, '4': 1, '5': 12, '10': 'ssid'},
    const {'1': 'channel', '3': 2, '4': 1, '5': 13, '10': 'channel'},
    const {'1': 'rssi', '3': 3, '4': 1, '5': 5, '10': 'rssi'},
    const {'1': 'bssid', '3': 4, '4': 1, '5': 12, '10': 'bssid'},
    const {'1': 'auth', '3': 5, '4': 1, '5': 14, '6': '.WifiAuthMode', '10': 'auth'},
  ],
};

/// Descriptor for `WiFiScanResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wiFiScanResultDescriptor = $convert.base64Decode('Cg5XaUZpU2NhblJlc3VsdBISCgRzc2lkGAEgASgMUgRzc2lkEhgKB2NoYW5uZWwYAiABKA1SB2NoYW5uZWwSEgoEcnNzaRgDIAEoBVIEcnNzaRIUCgVic3NpZBgEIAEoDFIFYnNzaWQSIQoEYXV0aBgFIAEoDjINLldpZmlBdXRoTW9kZVIEYXV0aA==');
@$core.Deprecated('Use respScanResultDescriptor instead')
const RespScanResult$json = const {
  '1': 'RespScanResult',
  '2': const [
    const {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.WiFiScanResult', '10': 'entries'},
  ],
};

/// Descriptor for `RespScanResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respScanResultDescriptor = $convert.base64Decode('Cg5SZXNwU2NhblJlc3VsdBIpCgdlbnRyaWVzGAEgAygLMg8uV2lGaVNjYW5SZXN1bHRSB2VudHJpZXM=');
@$core.Deprecated('Use wiFiScanPayloadDescriptor instead')
const WiFiScanPayload$json = const {
  '1': 'WiFiScanPayload',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.WiFiScanMsgType', '10': 'msg'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'cmd_scan_start', '3': 10, '4': 1, '5': 11, '6': '.CmdScanStart', '9': 0, '10': 'cmdScanStart'},
    const {'1': 'resp_scan_start', '3': 11, '4': 1, '5': 11, '6': '.RespScanStart', '9': 0, '10': 'respScanStart'},
    const {'1': 'cmd_scan_status', '3': 12, '4': 1, '5': 11, '6': '.CmdScanStatus', '9': 0, '10': 'cmdScanStatus'},
    const {'1': 'resp_scan_status', '3': 13, '4': 1, '5': 11, '6': '.RespScanStatus', '9': 0, '10': 'respScanStatus'},
    const {'1': 'cmd_scan_result', '3': 14, '4': 1, '5': 11, '6': '.CmdScanResult', '9': 0, '10': 'cmdScanResult'},
    const {'1': 'resp_scan_result', '3': 15, '4': 1, '5': 11, '6': '.RespScanResult', '9': 0, '10': 'respScanResult'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `WiFiScanPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wiFiScanPayloadDescriptor = $convert.base64Decode('Cg9XaUZpU2NhblBheWxvYWQSIgoDbXNnGAEgASgOMhAuV2lGaVNjYW5Nc2dUeXBlUgNtc2cSHwoGc3RhdHVzGAIgASgOMgcuU3RhdHVzUgZzdGF0dXMSNQoOY21kX3NjYW5fc3RhcnQYCiABKAsyDS5DbWRTY2FuU3RhcnRIAFIMY21kU2NhblN0YXJ0EjgKD3Jlc3Bfc2Nhbl9zdGFydBgLIAEoCzIOLlJlc3BTY2FuU3RhcnRIAFINcmVzcFNjYW5TdGFydBI4Cg9jbWRfc2Nhbl9zdGF0dXMYDCABKAsyDi5DbWRTY2FuU3RhdHVzSABSDWNtZFNjYW5TdGF0dXMSOwoQcmVzcF9zY2FuX3N0YXR1cxgNIAEoCzIPLlJlc3BTY2FuU3RhdHVzSABSDnJlc3BTY2FuU3RhdHVzEjgKD2NtZF9zY2FuX3Jlc3VsdBgOIAEoCzIOLkNtZFNjYW5SZXN1bHRIAFINY21kU2NhblJlc3VsdBI7ChByZXNwX3NjYW5fcmVzdWx0GA8gASgLMg8uUmVzcFNjYW5SZXN1bHRIAFIOcmVzcFNjYW5SZXN1bHRCCQoHcGF5bG9hZA==');
