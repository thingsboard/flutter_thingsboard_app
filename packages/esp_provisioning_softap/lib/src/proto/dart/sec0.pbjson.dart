///
//  Generated code. Do not modify.
//  source: sec0.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sec0MsgTypeDescriptor instead')
const Sec0MsgType$json = const {
  '1': 'Sec0MsgType',
  '2': const [
    const {'1': 'S0_Session_Command', '2': 0},
    const {'1': 'S0_Session_Response', '2': 1},
  ],
};

/// Descriptor for `Sec0MsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sec0MsgTypeDescriptor = $convert.base64Decode('CgtTZWMwTXNnVHlwZRIWChJTMF9TZXNzaW9uX0NvbW1hbmQQABIXChNTMF9TZXNzaW9uX1Jlc3BvbnNlEAE=');
@$core.Deprecated('Use s0SessionCmdDescriptor instead')
const S0SessionCmd$json = const {
  '1': 'S0SessionCmd',
};

/// Descriptor for `S0SessionCmd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s0SessionCmdDescriptor = $convert.base64Decode('CgxTMFNlc3Npb25DbWQ=');
@$core.Deprecated('Use s0SessionRespDescriptor instead')
const S0SessionResp$json = const {
  '1': 'S0SessionResp',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

/// Descriptor for `S0SessionResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s0SessionRespDescriptor = $convert.base64Decode('Cg1TMFNlc3Npb25SZXNwEh8KBnN0YXR1cxgBIAEoDjIHLlN0YXR1c1IGc3RhdHVz');
@$core.Deprecated('Use sec0PayloadDescriptor instead')
const Sec0Payload$json = const {
  '1': 'Sec0Payload',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.Sec0MsgType', '10': 'msg'},
    const {'1': 'sc', '3': 20, '4': 1, '5': 11, '6': '.S0SessionCmd', '9': 0, '10': 'sc'},
    const {'1': 'sr', '3': 21, '4': 1, '5': 11, '6': '.S0SessionResp', '9': 0, '10': 'sr'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Sec0Payload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sec0PayloadDescriptor = $convert.base64Decode('CgtTZWMwUGF5bG9hZBIeCgNtc2cYASABKA4yDC5TZWMwTXNnVHlwZVIDbXNnEh8KAnNjGBQgASgLMg0uUzBTZXNzaW9uQ21kSABSAnNjEiAKAnNyGBUgASgLMg4uUzBTZXNzaW9uUmVzcEgAUgJzckIJCgdwYXlsb2Fk');
