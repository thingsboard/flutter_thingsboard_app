///
//  Generated code. Do not modify.
//  source: wifi_scan.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wifi_constants.pbenum.dart' as $0;
import 'wifi_scan.pbenum.dart';
import 'constants.pbenum.dart' as $1;

export 'wifi_scan.pbenum.dart';

class CmdScanStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdScanStart', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blocking')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passive')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupChannels', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'periodMs', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  CmdScanStart._() : super();
  factory CmdScanStart({
    $core.bool? blocking,
    $core.bool? passive,
    $core.int? groupChannels,
    $core.int? periodMs,
  }) {
    final _result = create();
    if (blocking != null) {
      _result.blocking = blocking;
    }
    if (passive != null) {
      _result.passive = passive;
    }
    if (groupChannels != null) {
      _result.groupChannels = groupChannels;
    }
    if (periodMs != null) {
      _result.periodMs = periodMs;
    }
    return _result;
  }
  factory CmdScanStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdScanStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdScanStart clone() => CmdScanStart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdScanStart copyWith(void Function(CmdScanStart) updates) => super.copyWith((message) => updates(message as CmdScanStart)) as CmdScanStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdScanStart create() => CmdScanStart._();
  CmdScanStart createEmptyInstance() => create();
  static $pb.PbList<CmdScanStart> createRepeated() => $pb.PbList<CmdScanStart>();
  @$core.pragma('dart2js:noInline')
  static CmdScanStart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdScanStart>(create);
  static CmdScanStart? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get blocking => $_getBF(0);
  @$pb.TagNumber(1)
  set blocking($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlocking() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlocking() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get passive => $_getBF(1);
  @$pb.TagNumber(2)
  set passive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassive() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassive() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupChannels => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupChannels($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupChannels() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupChannels() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get periodMs => $_getIZ(3);
  @$pb.TagNumber(4)
  set periodMs($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPeriodMs() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriodMs() => clearField(4);
}

class RespScanStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespScanStart', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RespScanStart._() : super();
  factory RespScanStart() => create();
  factory RespScanStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespScanStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespScanStart clone() => RespScanStart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespScanStart copyWith(void Function(RespScanStart) updates) => super.copyWith((message) => updates(message as RespScanStart)) as RespScanStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespScanStart create() => RespScanStart._();
  RespScanStart createEmptyInstance() => create();
  static $pb.PbList<RespScanStart> createRepeated() => $pb.PbList<RespScanStart>();
  @$core.pragma('dart2js:noInline')
  static RespScanStart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespScanStart>(create);
  static RespScanStart? _defaultInstance;
}

class CmdScanStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdScanStatus', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CmdScanStatus._() : super();
  factory CmdScanStatus() => create();
  factory CmdScanStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdScanStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdScanStatus clone() => CmdScanStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdScanStatus copyWith(void Function(CmdScanStatus) updates) => super.copyWith((message) => updates(message as CmdScanStatus)) as CmdScanStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdScanStatus create() => CmdScanStatus._();
  CmdScanStatus createEmptyInstance() => create();
  static $pb.PbList<CmdScanStatus> createRepeated() => $pb.PbList<CmdScanStatus>();
  @$core.pragma('dart2js:noInline')
  static CmdScanStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdScanStatus>(create);
  static CmdScanStatus? _defaultInstance;
}

class RespScanStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespScanStatus', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scanFinished')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resultCount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  RespScanStatus._() : super();
  factory RespScanStatus({
    $core.bool? scanFinished,
    $core.int? resultCount,
  }) {
    final _result = create();
    if (scanFinished != null) {
      _result.scanFinished = scanFinished;
    }
    if (resultCount != null) {
      _result.resultCount = resultCount;
    }
    return _result;
  }
  factory RespScanStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespScanStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespScanStatus clone() => RespScanStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespScanStatus copyWith(void Function(RespScanStatus) updates) => super.copyWith((message) => updates(message as RespScanStatus)) as RespScanStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespScanStatus create() => RespScanStatus._();
  RespScanStatus createEmptyInstance() => create();
  static $pb.PbList<RespScanStatus> createRepeated() => $pb.PbList<RespScanStatus>();
  @$core.pragma('dart2js:noInline')
  static RespScanStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespScanStatus>(create);
  static RespScanStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get scanFinished => $_getBF(0);
  @$pb.TagNumber(1)
  set scanFinished($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasScanFinished() => $_has(0);
  @$pb.TagNumber(1)
  void clearScanFinished() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get resultCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set resultCount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResultCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearResultCount() => clearField(2);
}

class CmdScanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdScanResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startIndex', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  CmdScanResult._() : super();
  factory CmdScanResult({
    $core.int? startIndex,
    $core.int? count,
  }) {
    final _result = create();
    if (startIndex != null) {
      _result.startIndex = startIndex;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory CmdScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdScanResult clone() => CmdScanResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdScanResult copyWith(void Function(CmdScanResult) updates) => super.copyWith((message) => updates(message as CmdScanResult)) as CmdScanResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdScanResult create() => CmdScanResult._();
  CmdScanResult createEmptyInstance() => create();
  static $pb.PbList<CmdScanResult> createRepeated() => $pb.PbList<CmdScanResult>();
  @$core.pragma('dart2js:noInline')
  static CmdScanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdScanResult>(create);
  static CmdScanResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get startIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set startIndex($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class WiFiScanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WiFiScanResult', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ssid', $pb.PbFieldType.OY)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rssi', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bssid', $pb.PbFieldType.OY)
    ..e<$0.WifiAuthMode>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'auth', $pb.PbFieldType.OE, defaultOrMaker: $0.WifiAuthMode.Open, valueOf: $0.WifiAuthMode.valueOf, enumValues: $0.WifiAuthMode.values)
    ..hasRequiredFields = false
  ;

  WiFiScanResult._() : super();
  factory WiFiScanResult({
    $core.List<$core.int>? ssid,
    $core.int? channel,
    $core.int? rssi,
    $core.List<$core.int>? bssid,
    $0.WifiAuthMode? auth,
  }) {
    final _result = create();
    if (ssid != null) {
      _result.ssid = ssid;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    if (rssi != null) {
      _result.rssi = rssi;
    }
    if (bssid != null) {
      _result.bssid = bssid;
    }
    if (auth != null) {
      _result.auth = auth;
    }
    return _result;
  }
  factory WiFiScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WiFiScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WiFiScanResult clone() => WiFiScanResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WiFiScanResult copyWith(void Function(WiFiScanResult) updates) => super.copyWith((message) => updates(message as WiFiScanResult)) as WiFiScanResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WiFiScanResult create() => WiFiScanResult._();
  WiFiScanResult createEmptyInstance() => create();
  static $pb.PbList<WiFiScanResult> createRepeated() => $pb.PbList<WiFiScanResult>();
  @$core.pragma('dart2js:noInline')
  static WiFiScanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WiFiScanResult>(create);
  static WiFiScanResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ssid => $_getN(0);
  @$pb.TagNumber(1)
  set ssid($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get channel => $_getIZ(1);
  @$pb.TagNumber(2)
  set channel($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rssi => $_getIZ(2);
  @$pb.TagNumber(3)
  set rssi($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRssi() => $_has(2);
  @$pb.TagNumber(3)
  void clearRssi() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bssid => $_getN(3);
  @$pb.TagNumber(4)
  set bssid($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBssid() => $_has(3);
  @$pb.TagNumber(4)
  void clearBssid() => clearField(4);

  @$pb.TagNumber(5)
  $0.WifiAuthMode get auth => $_getN(4);
  @$pb.TagNumber(5)
  set auth($0.WifiAuthMode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuth() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuth() => clearField(5);
}

class RespScanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespScanResult', createEmptyInstance: create)
    ..pc<WiFiScanResult>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entries', $pb.PbFieldType.PM, subBuilder: WiFiScanResult.create)
    ..hasRequiredFields = false
  ;

  RespScanResult._() : super();
  factory RespScanResult({
    $core.Iterable<WiFiScanResult>? entries,
  }) {
    final _result = create();
    if (entries != null) {
      _result.entries.addAll(entries);
    }
    return _result;
  }
  factory RespScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespScanResult clone() => RespScanResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespScanResult copyWith(void Function(RespScanResult) updates) => super.copyWith((message) => updates(message as RespScanResult)) as RespScanResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespScanResult create() => RespScanResult._();
  RespScanResult createEmptyInstance() => create();
  static $pb.PbList<RespScanResult> createRepeated() => $pb.PbList<RespScanResult>();
  @$core.pragma('dart2js:noInline')
  static RespScanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespScanResult>(create);
  static RespScanResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WiFiScanResult> get entries => $_getList(0);
}

enum WiFiScanPayload_Payload {
  cmdScanStart, 
  respScanStart, 
  cmdScanStatus, 
  respScanStatus, 
  cmdScanResult, 
  respScanResult, 
  notSet
}

class WiFiScanPayload extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, WiFiScanPayload_Payload> _WiFiScanPayload_PayloadByTag = {
    10 : WiFiScanPayload_Payload.cmdScanStart,
    11 : WiFiScanPayload_Payload.respScanStart,
    12 : WiFiScanPayload_Payload.cmdScanStatus,
    13 : WiFiScanPayload_Payload.respScanStatus,
    14 : WiFiScanPayload_Payload.cmdScanResult,
    15 : WiFiScanPayload_Payload.respScanResult,
    0 : WiFiScanPayload_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WiFiScanPayload', createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15])
    ..e<WiFiScanMsgType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg', $pb.PbFieldType.OE, defaultOrMaker: WiFiScanMsgType.TypeCmdScanStart, valueOf: WiFiScanMsgType.valueOf, enumValues: WiFiScanMsgType.values)
    ..e<$1.Status>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $1.Status.Success, valueOf: $1.Status.valueOf, enumValues: $1.Status.values)
    ..aOM<CmdScanStart>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdScanStart', subBuilder: CmdScanStart.create)
    ..aOM<RespScanStart>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respScanStart', subBuilder: RespScanStart.create)
    ..aOM<CmdScanStatus>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdScanStatus', subBuilder: CmdScanStatus.create)
    ..aOM<RespScanStatus>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respScanStatus', subBuilder: RespScanStatus.create)
    ..aOM<CmdScanResult>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdScanResult', subBuilder: CmdScanResult.create)
    ..aOM<RespScanResult>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respScanResult', subBuilder: RespScanResult.create)
    ..hasRequiredFields = false
  ;

  WiFiScanPayload._() : super();
  factory WiFiScanPayload({
    WiFiScanMsgType? msg,
    $1.Status? status,
    CmdScanStart? cmdScanStart,
    RespScanStart? respScanStart,
    CmdScanStatus? cmdScanStatus,
    RespScanStatus? respScanStatus,
    CmdScanResult? cmdScanResult,
    RespScanResult? respScanResult,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (status != null) {
      _result.status = status;
    }
    if (cmdScanStart != null) {
      _result.cmdScanStart = cmdScanStart;
    }
    if (respScanStart != null) {
      _result.respScanStart = respScanStart;
    }
    if (cmdScanStatus != null) {
      _result.cmdScanStatus = cmdScanStatus;
    }
    if (respScanStatus != null) {
      _result.respScanStatus = respScanStatus;
    }
    if (cmdScanResult != null) {
      _result.cmdScanResult = cmdScanResult;
    }
    if (respScanResult != null) {
      _result.respScanResult = respScanResult;
    }
    return _result;
  }
  factory WiFiScanPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WiFiScanPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WiFiScanPayload clone() => WiFiScanPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WiFiScanPayload copyWith(void Function(WiFiScanPayload) updates) => super.copyWith((message) => updates(message as WiFiScanPayload)) as WiFiScanPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WiFiScanPayload create() => WiFiScanPayload._();
  WiFiScanPayload createEmptyInstance() => create();
  static $pb.PbList<WiFiScanPayload> createRepeated() => $pb.PbList<WiFiScanPayload>();
  @$core.pragma('dart2js:noInline')
  static WiFiScanPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WiFiScanPayload>(create);
  static WiFiScanPayload? _defaultInstance;

  WiFiScanPayload_Payload whichPayload() => _WiFiScanPayload_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  WiFiScanMsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(WiFiScanMsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $1.Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status($1.Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(10)
  CmdScanStart get cmdScanStart => $_getN(2);
  @$pb.TagNumber(10)
  set cmdScanStart(CmdScanStart v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCmdScanStart() => $_has(2);
  @$pb.TagNumber(10)
  void clearCmdScanStart() => clearField(10);
  @$pb.TagNumber(10)
  CmdScanStart ensureCmdScanStart() => $_ensure(2);

  @$pb.TagNumber(11)
  RespScanStart get respScanStart => $_getN(3);
  @$pb.TagNumber(11)
  set respScanStart(RespScanStart v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRespScanStart() => $_has(3);
  @$pb.TagNumber(11)
  void clearRespScanStart() => clearField(11);
  @$pb.TagNumber(11)
  RespScanStart ensureRespScanStart() => $_ensure(3);

  @$pb.TagNumber(12)
  CmdScanStatus get cmdScanStatus => $_getN(4);
  @$pb.TagNumber(12)
  set cmdScanStatus(CmdScanStatus v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCmdScanStatus() => $_has(4);
  @$pb.TagNumber(12)
  void clearCmdScanStatus() => clearField(12);
  @$pb.TagNumber(12)
  CmdScanStatus ensureCmdScanStatus() => $_ensure(4);

  @$pb.TagNumber(13)
  RespScanStatus get respScanStatus => $_getN(5);
  @$pb.TagNumber(13)
  set respScanStatus(RespScanStatus v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasRespScanStatus() => $_has(5);
  @$pb.TagNumber(13)
  void clearRespScanStatus() => clearField(13);
  @$pb.TagNumber(13)
  RespScanStatus ensureRespScanStatus() => $_ensure(5);

  @$pb.TagNumber(14)
  CmdScanResult get cmdScanResult => $_getN(6);
  @$pb.TagNumber(14)
  set cmdScanResult(CmdScanResult v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCmdScanResult() => $_has(6);
  @$pb.TagNumber(14)
  void clearCmdScanResult() => clearField(14);
  @$pb.TagNumber(14)
  CmdScanResult ensureCmdScanResult() => $_ensure(6);

  @$pb.TagNumber(15)
  RespScanResult get respScanResult => $_getN(7);
  @$pb.TagNumber(15)
  set respScanResult(RespScanResult v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasRespScanResult() => $_has(7);
  @$pb.TagNumber(15)
  void clearRespScanResult() => clearField(15);
  @$pb.TagNumber(15)
  RespScanResult ensureRespScanResult() => $_ensure(7);
}

