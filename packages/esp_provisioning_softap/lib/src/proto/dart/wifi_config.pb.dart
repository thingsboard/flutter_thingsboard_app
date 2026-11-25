///
//  Generated code. Do not modify.
//  source: wifi_config.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wifi_constants.pb.dart' as $0;

import 'constants.pbenum.dart' as $1;
import 'wifi_constants.pbenum.dart' as $0;
import 'wifi_config.pbenum.dart';

export 'wifi_config.pbenum.dart';

class CmdGetStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdGetStatus', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CmdGetStatus._() : super();
  factory CmdGetStatus() => create();
  factory CmdGetStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdGetStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdGetStatus clone() => CmdGetStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdGetStatus copyWith(void Function(CmdGetStatus) updates) => super.copyWith((message) => updates(message as CmdGetStatus)) as CmdGetStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdGetStatus create() => CmdGetStatus._();
  CmdGetStatus createEmptyInstance() => create();
  static $pb.PbList<CmdGetStatus> createRepeated() => $pb.PbList<CmdGetStatus>();
  @$core.pragma('dart2js:noInline')
  static CmdGetStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdGetStatus>(create);
  static CmdGetStatus? _defaultInstance;
}

enum RespGetStatus_State {
  failReason, 
  connected, 
  notSet
}

class RespGetStatus extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, RespGetStatus_State> _RespGetStatus_StateByTag = {
    10 : RespGetStatus_State.failReason,
    11 : RespGetStatus_State.connected,
    0 : RespGetStatus_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespGetStatus', createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..e<$1.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $1.Status.Success, valueOf: $1.Status.valueOf, enumValues: $1.Status.values)
    ..e<$0.WifiStationState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'staState', $pb.PbFieldType.OE, defaultOrMaker: $0.WifiStationState.Connected, valueOf: $0.WifiStationState.valueOf, enumValues: $0.WifiStationState.values)
    ..e<$0.WifiConnectFailedReason>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'failReason', $pb.PbFieldType.OE, defaultOrMaker: $0.WifiConnectFailedReason.AuthError, valueOf: $0.WifiConnectFailedReason.valueOf, enumValues: $0.WifiConnectFailedReason.values)
    ..aOM<$0.WifiConnectedState>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connected', subBuilder: $0.WifiConnectedState.create)
    ..hasRequiredFields = false
  ;

  RespGetStatus._() : super();
  factory RespGetStatus({
    $1.Status? status,
    $0.WifiStationState? staState,
    $0.WifiConnectFailedReason? failReason,
    $0.WifiConnectedState? connected,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (staState != null) {
      _result.staState = staState;
    }
    if (failReason != null) {
      _result.failReason = failReason;
    }
    if (connected != null) {
      _result.connected = connected;
    }
    return _result;
  }
  factory RespGetStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespGetStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespGetStatus clone() => RespGetStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespGetStatus copyWith(void Function(RespGetStatus) updates) => super.copyWith((message) => updates(message as RespGetStatus)) as RespGetStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetStatus create() => RespGetStatus._();
  RespGetStatus createEmptyInstance() => create();
  static $pb.PbList<RespGetStatus> createRepeated() => $pb.PbList<RespGetStatus>();
  @$core.pragma('dart2js:noInline')
  static RespGetStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespGetStatus>(create);
  static RespGetStatus? _defaultInstance;

  RespGetStatus_State whichState() => _RespGetStatus_StateByTag[$_whichOneof(0)]!;
  void clearState() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($1.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $0.WifiStationState get staState => $_getN(1);
  @$pb.TagNumber(2)
  set staState($0.WifiStationState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStaState() => $_has(1);
  @$pb.TagNumber(2)
  void clearStaState() => clearField(2);

  @$pb.TagNumber(10)
  $0.WifiConnectFailedReason get failReason => $_getN(2);
  @$pb.TagNumber(10)
  set failReason($0.WifiConnectFailedReason v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFailReason() => $_has(2);
  @$pb.TagNumber(10)
  void clearFailReason() => clearField(10);

  @$pb.TagNumber(11)
  $0.WifiConnectedState get connected => $_getN(3);
  @$pb.TagNumber(11)
  set connected($0.WifiConnectedState v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasConnected() => $_has(3);
  @$pb.TagNumber(11)
  void clearConnected() => clearField(11);
  @$pb.TagNumber(11)
  $0.WifiConnectedState ensureConnected() => $_ensure(3);
}

class CmdSetConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdSetConfig', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ssid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passphrase', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bssid', $pb.PbFieldType.OY)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CmdSetConfig._() : super();
  factory CmdSetConfig({
    $core.List<$core.int>? ssid,
    $core.List<$core.int>? passphrase,
    $core.List<$core.int>? bssid,
    $core.int? channel,
  }) {
    final _result = create();
    if (ssid != null) {
      _result.ssid = ssid;
    }
    if (passphrase != null) {
      _result.passphrase = passphrase;
    }
    if (bssid != null) {
      _result.bssid = bssid;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    return _result;
  }
  factory CmdSetConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdSetConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdSetConfig clone() => CmdSetConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdSetConfig copyWith(void Function(CmdSetConfig) updates) => super.copyWith((message) => updates(message as CmdSetConfig)) as CmdSetConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdSetConfig create() => CmdSetConfig._();
  CmdSetConfig createEmptyInstance() => create();
  static $pb.PbList<CmdSetConfig> createRepeated() => $pb.PbList<CmdSetConfig>();
  @$core.pragma('dart2js:noInline')
  static CmdSetConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdSetConfig>(create);
  static CmdSetConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ssid => $_getN(0);
  @$pb.TagNumber(1)
  set ssid($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get passphrase => $_getN(1);
  @$pb.TagNumber(2)
  set passphrase($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassphrase() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassphrase() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get bssid => $_getN(2);
  @$pb.TagNumber(3)
  set bssid($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBssid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBssid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get channel => $_getIZ(3);
  @$pb.TagNumber(4)
  set channel($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannel() => clearField(4);
}

class RespSetConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespSetConfig', createEmptyInstance: create)
    ..e<$1.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $1.Status.Success, valueOf: $1.Status.valueOf, enumValues: $1.Status.values)
    ..hasRequiredFields = false
  ;

  RespSetConfig._() : super();
  factory RespSetConfig({
    $1.Status? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RespSetConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespSetConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespSetConfig clone() => RespSetConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespSetConfig copyWith(void Function(RespSetConfig) updates) => super.copyWith((message) => updates(message as RespSetConfig)) as RespSetConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespSetConfig create() => RespSetConfig._();
  RespSetConfig createEmptyInstance() => create();
  static $pb.PbList<RespSetConfig> createRepeated() => $pb.PbList<RespSetConfig>();
  @$core.pragma('dart2js:noInline')
  static RespSetConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespSetConfig>(create);
  static RespSetConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($1.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class CmdApplyConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdApplyConfig', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CmdApplyConfig._() : super();
  factory CmdApplyConfig() => create();
  factory CmdApplyConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdApplyConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdApplyConfig clone() => CmdApplyConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdApplyConfig copyWith(void Function(CmdApplyConfig) updates) => super.copyWith((message) => updates(message as CmdApplyConfig)) as CmdApplyConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdApplyConfig create() => CmdApplyConfig._();
  CmdApplyConfig createEmptyInstance() => create();
  static $pb.PbList<CmdApplyConfig> createRepeated() => $pb.PbList<CmdApplyConfig>();
  @$core.pragma('dart2js:noInline')
  static CmdApplyConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdApplyConfig>(create);
  static CmdApplyConfig? _defaultInstance;
}

class RespApplyConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespApplyConfig', createEmptyInstance: create)
    ..e<$1.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $1.Status.Success, valueOf: $1.Status.valueOf, enumValues: $1.Status.values)
    ..hasRequiredFields = false
  ;

  RespApplyConfig._() : super();
  factory RespApplyConfig({
    $1.Status? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RespApplyConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespApplyConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespApplyConfig clone() => RespApplyConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespApplyConfig copyWith(void Function(RespApplyConfig) updates) => super.copyWith((message) => updates(message as RespApplyConfig)) as RespApplyConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespApplyConfig create() => RespApplyConfig._();
  RespApplyConfig createEmptyInstance() => create();
  static $pb.PbList<RespApplyConfig> createRepeated() => $pb.PbList<RespApplyConfig>();
  @$core.pragma('dart2js:noInline')
  static RespApplyConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespApplyConfig>(create);
  static RespApplyConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($1.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

enum WiFiConfigPayload_Payload {
  cmdGetStatus, 
  respGetStatus, 
  cmdSetConfig, 
  respSetConfig, 
  cmdApplyConfig, 
  respApplyConfig, 
  notSet
}

class WiFiConfigPayload extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, WiFiConfigPayload_Payload> _WiFiConfigPayload_PayloadByTag = {
    10 : WiFiConfigPayload_Payload.cmdGetStatus,
    11 : WiFiConfigPayload_Payload.respGetStatus,
    12 : WiFiConfigPayload_Payload.cmdSetConfig,
    13 : WiFiConfigPayload_Payload.respSetConfig,
    14 : WiFiConfigPayload_Payload.cmdApplyConfig,
    15 : WiFiConfigPayload_Payload.respApplyConfig,
    0 : WiFiConfigPayload_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WiFiConfigPayload', createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15])
    ..e<WiFiConfigMsgType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg', $pb.PbFieldType.OE, defaultOrMaker: WiFiConfigMsgType.TypeCmdGetStatus, valueOf: WiFiConfigMsgType.valueOf, enumValues: WiFiConfigMsgType.values)
    ..aOM<CmdGetStatus>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdGetStatus', subBuilder: CmdGetStatus.create)
    ..aOM<RespGetStatus>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respGetStatus', subBuilder: RespGetStatus.create)
    ..aOM<CmdSetConfig>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdSetConfig', subBuilder: CmdSetConfig.create)
    ..aOM<RespSetConfig>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respSetConfig', subBuilder: RespSetConfig.create)
    ..aOM<CmdApplyConfig>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdApplyConfig', subBuilder: CmdApplyConfig.create)
    ..aOM<RespApplyConfig>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respApplyConfig', subBuilder: RespApplyConfig.create)
    ..hasRequiredFields = false
  ;

  WiFiConfigPayload._() : super();
  factory WiFiConfigPayload({
    WiFiConfigMsgType? msg,
    CmdGetStatus? cmdGetStatus,
    RespGetStatus? respGetStatus,
    CmdSetConfig? cmdSetConfig,
    RespSetConfig? respSetConfig,
    CmdApplyConfig? cmdApplyConfig,
    RespApplyConfig? respApplyConfig,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (cmdGetStatus != null) {
      _result.cmdGetStatus = cmdGetStatus;
    }
    if (respGetStatus != null) {
      _result.respGetStatus = respGetStatus;
    }
    if (cmdSetConfig != null) {
      _result.cmdSetConfig = cmdSetConfig;
    }
    if (respSetConfig != null) {
      _result.respSetConfig = respSetConfig;
    }
    if (cmdApplyConfig != null) {
      _result.cmdApplyConfig = cmdApplyConfig;
    }
    if (respApplyConfig != null) {
      _result.respApplyConfig = respApplyConfig;
    }
    return _result;
  }
  factory WiFiConfigPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WiFiConfigPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WiFiConfigPayload clone() => WiFiConfigPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WiFiConfigPayload copyWith(void Function(WiFiConfigPayload) updates) => super.copyWith((message) => updates(message as WiFiConfigPayload)) as WiFiConfigPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WiFiConfigPayload create() => WiFiConfigPayload._();
  WiFiConfigPayload createEmptyInstance() => create();
  static $pb.PbList<WiFiConfigPayload> createRepeated() => $pb.PbList<WiFiConfigPayload>();
  @$core.pragma('dart2js:noInline')
  static WiFiConfigPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WiFiConfigPayload>(create);
  static WiFiConfigPayload? _defaultInstance;

  WiFiConfigPayload_Payload whichPayload() => _WiFiConfigPayload_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  WiFiConfigMsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(WiFiConfigMsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(10)
  CmdGetStatus get cmdGetStatus => $_getN(1);
  @$pb.TagNumber(10)
  set cmdGetStatus(CmdGetStatus v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCmdGetStatus() => $_has(1);
  @$pb.TagNumber(10)
  void clearCmdGetStatus() => clearField(10);
  @$pb.TagNumber(10)
  CmdGetStatus ensureCmdGetStatus() => $_ensure(1);

  @$pb.TagNumber(11)
  RespGetStatus get respGetStatus => $_getN(2);
  @$pb.TagNumber(11)
  set respGetStatus(RespGetStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRespGetStatus() => $_has(2);
  @$pb.TagNumber(11)
  void clearRespGetStatus() => clearField(11);
  @$pb.TagNumber(11)
  RespGetStatus ensureRespGetStatus() => $_ensure(2);

  @$pb.TagNumber(12)
  CmdSetConfig get cmdSetConfig => $_getN(3);
  @$pb.TagNumber(12)
  set cmdSetConfig(CmdSetConfig v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCmdSetConfig() => $_has(3);
  @$pb.TagNumber(12)
  void clearCmdSetConfig() => clearField(12);
  @$pb.TagNumber(12)
  CmdSetConfig ensureCmdSetConfig() => $_ensure(3);

  @$pb.TagNumber(13)
  RespSetConfig get respSetConfig => $_getN(4);
  @$pb.TagNumber(13)
  set respSetConfig(RespSetConfig v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasRespSetConfig() => $_has(4);
  @$pb.TagNumber(13)
  void clearRespSetConfig() => clearField(13);
  @$pb.TagNumber(13)
  RespSetConfig ensureRespSetConfig() => $_ensure(4);

  @$pb.TagNumber(14)
  CmdApplyConfig get cmdApplyConfig => $_getN(5);
  @$pb.TagNumber(14)
  set cmdApplyConfig(CmdApplyConfig v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCmdApplyConfig() => $_has(5);
  @$pb.TagNumber(14)
  void clearCmdApplyConfig() => clearField(14);
  @$pb.TagNumber(14)
  CmdApplyConfig ensureCmdApplyConfig() => $_ensure(5);

  @$pb.TagNumber(15)
  RespApplyConfig get respApplyConfig => $_getN(6);
  @$pb.TagNumber(15)
  set respApplyConfig(RespApplyConfig v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasRespApplyConfig() => $_has(6);
  @$pb.TagNumber(15)
  void clearRespApplyConfig() => clearField(15);
  @$pb.TagNumber(15)
  RespApplyConfig ensureRespApplyConfig() => $_ensure(6);
}

