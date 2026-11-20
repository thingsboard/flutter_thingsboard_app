///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use secSchemeVersionDescriptor instead')
const SecSchemeVersion$json = const {
  '1': 'SecSchemeVersion',
  '2': const [
    const {'1': 'SecScheme0', '2': 0},
    const {'1': 'SecScheme1', '2': 1},
  ],
};

/// Descriptor for `SecSchemeVersion`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List secSchemeVersionDescriptor = $convert.base64Decode('ChBTZWNTY2hlbWVWZXJzaW9uEg4KClNlY1NjaGVtZTAQABIOCgpTZWNTY2hlbWUxEAE=');
@$core.Deprecated('Use sessionDataDescriptor instead')
const SessionData$json = const {
  '1': 'SessionData',
  '2': const [
    const {'1': 'sec_ver', '3': 2, '4': 1, '5': 14, '6': '.SecSchemeVersion', '10': 'secVer'},
    const {'1': 'sec0', '3': 10, '4': 1, '5': 11, '6': '.Sec0Payload', '9': 0, '10': 'sec0'},
    const {'1': 'sec1', '3': 11, '4': 1, '5': 11, '6': '.Sec1Payload', '9': 0, '10': 'sec1'},
  ],
  '8': const [
    const {'1': 'proto'},
  ],
};

/// Descriptor for `SessionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDataDescriptor = $convert.base64Decode('CgtTZXNzaW9uRGF0YRIqCgdzZWNfdmVyGAIgASgOMhEuU2VjU2NoZW1lVmVyc2lvblIGc2VjVmVyEiIKBHNlYzAYCiABKAsyDC5TZWMwUGF5bG9hZEgAUgRzZWMwEiIKBHNlYzEYCyABKAsyDC5TZWMxUGF5bG9hZEgAUgRzZWMxQgcKBXByb3Rv');
