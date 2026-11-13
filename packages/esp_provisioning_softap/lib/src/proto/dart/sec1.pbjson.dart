///
//  Generated code. Do not modify.
//  source: sec1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sec1MsgTypeDescriptor instead')
const Sec1MsgType$json = const {
  '1': 'Sec1MsgType',
  '2': const [
    const {'1': 'Session_Command0', '2': 0},
    const {'1': 'Session_Response0', '2': 1},
    const {'1': 'Session_Command1', '2': 2},
    const {'1': 'Session_Response1', '2': 3},
  ],
};

/// Descriptor for `Sec1MsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sec1MsgTypeDescriptor = $convert.base64Decode('CgtTZWMxTXNnVHlwZRIUChBTZXNzaW9uX0NvbW1hbmQwEAASFQoRU2Vzc2lvbl9SZXNwb25zZTAQARIUChBTZXNzaW9uX0NvbW1hbmQxEAISFQoRU2Vzc2lvbl9SZXNwb25zZTEQAw==');
@$core.Deprecated('Use sessionCmd1Descriptor instead')
const SessionCmd1$json = const {
  '1': 'SessionCmd1',
  '2': const [
    const {'1': 'client_verify_data', '3': 2, '4': 1, '5': 12, '10': 'clientVerifyData'},
  ],
};

/// Descriptor for `SessionCmd1`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionCmd1Descriptor = $convert.base64Decode('CgtTZXNzaW9uQ21kMRIsChJjbGllbnRfdmVyaWZ5X2RhdGEYAiABKAxSEGNsaWVudFZlcmlmeURhdGE=');
@$core.Deprecated('Use sessionResp1Descriptor instead')
const SessionResp1$json = const {
  '1': 'SessionResp1',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'device_verify_data', '3': 3, '4': 1, '5': 12, '10': 'deviceVerifyData'},
  ],
};

/// Descriptor for `SessionResp1`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionResp1Descriptor = $convert.base64Decode('CgxTZXNzaW9uUmVzcDESHwoGc3RhdHVzGAEgASgOMgcuU3RhdHVzUgZzdGF0dXMSLAoSZGV2aWNlX3ZlcmlmeV9kYXRhGAMgASgMUhBkZXZpY2VWZXJpZnlEYXRh');
@$core.Deprecated('Use sessionCmd0Descriptor instead')
const SessionCmd0$json = const {
  '1': 'SessionCmd0',
  '2': const [
    const {'1': 'client_pubkey', '3': 1, '4': 1, '5': 12, '10': 'clientPubkey'},
  ],
};

/// Descriptor for `SessionCmd0`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionCmd0Descriptor = $convert.base64Decode('CgtTZXNzaW9uQ21kMBIjCg1jbGllbnRfcHVia2V5GAEgASgMUgxjbGllbnRQdWJrZXk=');
@$core.Deprecated('Use sessionResp0Descriptor instead')
const SessionResp0$json = const {
  '1': 'SessionResp0',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'device_pubkey', '3': 2, '4': 1, '5': 12, '10': 'devicePubkey'},
    const {'1': 'device_random', '3': 3, '4': 1, '5': 12, '10': 'deviceRandom'},
  ],
};

/// Descriptor for `SessionResp0`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionResp0Descriptor = $convert.base64Decode('CgxTZXNzaW9uUmVzcDASHwoGc3RhdHVzGAEgASgOMgcuU3RhdHVzUgZzdGF0dXMSIwoNZGV2aWNlX3B1YmtleRgCIAEoDFIMZGV2aWNlUHVia2V5EiMKDWRldmljZV9yYW5kb20YAyABKAxSDGRldmljZVJhbmRvbQ==');
@$core.Deprecated('Use sec1PayloadDescriptor instead')
const Sec1Payload$json = const {
  '1': 'Sec1Payload',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.Sec1MsgType', '10': 'msg'},
    const {'1': 'sc0', '3': 20, '4': 1, '5': 11, '6': '.SessionCmd0', '9': 0, '10': 'sc0'},
    const {'1': 'sr0', '3': 21, '4': 1, '5': 11, '6': '.SessionResp0', '9': 0, '10': 'sr0'},
    const {'1': 'sc1', '3': 22, '4': 1, '5': 11, '6': '.SessionCmd1', '9': 0, '10': 'sc1'},
    const {'1': 'sr1', '3': 23, '4': 1, '5': 11, '6': '.SessionResp1', '9': 0, '10': 'sr1'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Sec1Payload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sec1PayloadDescriptor = $convert.base64Decode('CgtTZWMxUGF5bG9hZBIeCgNtc2cYASABKA4yDC5TZWMxTXNnVHlwZVIDbXNnEiAKA3NjMBgUIAEoCzIMLlNlc3Npb25DbWQwSABSA3NjMBIhCgNzcjAYFSABKAsyDS5TZXNzaW9uUmVzcDBIAFIDc3IwEiAKA3NjMRgWIAEoCzIMLlNlc3Npb25DbWQxSABSA3NjMRIhCgNzcjEYFyABKAsyDS5TZXNzaW9uUmVzcDFIAFIDc3IxQgkKB3BheWxvYWQ=');
