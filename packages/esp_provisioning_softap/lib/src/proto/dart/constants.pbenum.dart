///
//  Generated code. Do not modify.
//  source: constants.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Status extends $pb.ProtobufEnum {
  static const Status Success = Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Success');
  static const Status InvalidSecScheme = Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'InvalidSecScheme');
  static const Status InvalidProto = Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'InvalidProto');
  static const Status TooManySessions = Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TooManySessions');
  static const Status InvalidArgument = Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'InvalidArgument');
  static const Status InternalError = Status._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'InternalError');
  static const Status CryptoError = Status._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CryptoError');
  static const Status InvalidSession = Status._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'InvalidSession');

  static const $core.List<Status> values = <Status> [
    Success,
    InvalidSecScheme,
    InvalidProto,
    TooManySessions,
    InvalidArgument,
    InternalError,
    CryptoError,
    InvalidSession,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status? valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}

