///
//  Generated code. Do not modify.
//  source: constants.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'Success', '2': 0},
    const {'1': 'InvalidSecScheme', '2': 1},
    const {'1': 'InvalidProto', '2': 2},
    const {'1': 'TooManySessions', '2': 3},
    const {'1': 'InvalidArgument', '2': 4},
    const {'1': 'InternalError', '2': 5},
    const {'1': 'CryptoError', '2': 6},
    const {'1': 'InvalidSession', '2': 7},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSCwoHU3VjY2VzcxAAEhQKEEludmFsaWRTZWNTY2hlbWUQARIQCgxJbnZhbGlkUHJvdG8QAhITCg9Ub29NYW55U2Vzc2lvbnMQAxITCg9JbnZhbGlkQXJndW1lbnQQBBIRCg1JbnRlcm5hbEVycm9yEAUSDwoLQ3J5cHRvRXJyb3IQBhISCg5JbnZhbGlkU2Vzc2lvbhAH');
