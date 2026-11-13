///
//  Generated code. Do not modify.
//  source: sec0.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'constants.pbenum.dart' as $0;
import 'sec0.pbenum.dart';

export 'sec0.pbenum.dart';

class S0SessionCmd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S0SessionCmd', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  S0SessionCmd._() : super();
  factory S0SessionCmd() => create();
  factory S0SessionCmd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S0SessionCmd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S0SessionCmd clone() => S0SessionCmd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S0SessionCmd copyWith(void Function(S0SessionCmd) updates) => super.copyWith((message) => updates(message as S0SessionCmd)) as S0SessionCmd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S0SessionCmd create() => S0SessionCmd._();
  S0SessionCmd createEmptyInstance() => create();
  static $pb.PbList<S0SessionCmd> createRepeated() => $pb.PbList<S0SessionCmd>();
  @$core.pragma('dart2js:noInline')
  static S0SessionCmd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S0SessionCmd>(create);
  static S0SessionCmd? _defaultInstance;
}

class S0SessionResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S0SessionResp', createEmptyInstance: create)
    ..e<$0.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..hasRequiredFields = false
  ;

  S0SessionResp._() : super();
  factory S0SessionResp({
    $0.Status? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory S0SessionResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S0SessionResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S0SessionResp clone() => S0SessionResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S0SessionResp copyWith(void Function(S0SessionResp) updates) => super.copyWith((message) => updates(message as S0SessionResp)) as S0SessionResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S0SessionResp create() => S0SessionResp._();
  S0SessionResp createEmptyInstance() => create();
  static $pb.PbList<S0SessionResp> createRepeated() => $pb.PbList<S0SessionResp>();
  @$core.pragma('dart2js:noInline')
  static S0SessionResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S0SessionResp>(create);
  static S0SessionResp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

enum Sec0Payload_Payload {
  sc, 
  sr, 
  notSet
}

class Sec0Payload extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Sec0Payload_Payload> _Sec0Payload_PayloadByTag = {
    20 : Sec0Payload_Payload.sc,
    21 : Sec0Payload_Payload.sr,
    0 : Sec0Payload_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Sec0Payload', createEmptyInstance: create)
    ..oo(0, [20, 21])
    ..e<Sec0MsgType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg', $pb.PbFieldType.OE, defaultOrMaker: Sec0MsgType.S0_Session_Command, valueOf: Sec0MsgType.valueOf, enumValues: Sec0MsgType.values)
    ..aOM<S0SessionCmd>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sc', subBuilder: S0SessionCmd.create)
    ..aOM<S0SessionResp>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sr', subBuilder: S0SessionResp.create)
    ..hasRequiredFields = false
  ;

  Sec0Payload._() : super();
  factory Sec0Payload({
    Sec0MsgType? msg,
    S0SessionCmd? sc,
    S0SessionResp? sr,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (sc != null) {
      _result.sc = sc;
    }
    if (sr != null) {
      _result.sr = sr;
    }
    return _result;
  }
  factory Sec0Payload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Sec0Payload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Sec0Payload clone() => Sec0Payload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Sec0Payload copyWith(void Function(Sec0Payload) updates) => super.copyWith((message) => updates(message as Sec0Payload)) as Sec0Payload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Sec0Payload create() => Sec0Payload._();
  Sec0Payload createEmptyInstance() => create();
  static $pb.PbList<Sec0Payload> createRepeated() => $pb.PbList<Sec0Payload>();
  @$core.pragma('dart2js:noInline')
  static Sec0Payload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sec0Payload>(create);
  static Sec0Payload? _defaultInstance;

  Sec0Payload_Payload whichPayload() => _Sec0Payload_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Sec0MsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(Sec0MsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(20)
  S0SessionCmd get sc => $_getN(1);
  @$pb.TagNumber(20)
  set sc(S0SessionCmd v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasSc() => $_has(1);
  @$pb.TagNumber(20)
  void clearSc() => clearField(20);
  @$pb.TagNumber(20)
  S0SessionCmd ensureSc() => $_ensure(1);

  @$pb.TagNumber(21)
  S0SessionResp get sr => $_getN(2);
  @$pb.TagNumber(21)
  set sr(S0SessionResp v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasSr() => $_has(2);
  @$pb.TagNumber(21)
  void clearSr() => clearField(21);
  @$pb.TagNumber(21)
  S0SessionResp ensureSr() => $_ensure(2);
}

