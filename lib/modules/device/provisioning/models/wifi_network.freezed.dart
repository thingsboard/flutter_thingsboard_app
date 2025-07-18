// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WifiNetwork _$WifiNetworkFromJson(Map<String, dynamic> json) {
  return _WifiNetwork.fromJson(json);
}

/// @nodoc
mixin _$WifiNetwork {
  String get ssid => throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;
  int get channel =>
      throw _privateConstructorUsedError; // required Uint8List bssid,
  String get auth => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this WifiNetwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WifiNetwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WifiNetworkCopyWith<WifiNetwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WifiNetworkCopyWith<$Res> {
  factory $WifiNetworkCopyWith(
          WifiNetwork value, $Res Function(WifiNetwork) then) =
      _$WifiNetworkCopyWithImpl<$Res, WifiNetwork>;
  @useResult
  $Res call({String ssid, int rssi, int channel, String auth, String password});
}

/// @nodoc
class _$WifiNetworkCopyWithImpl<$Res, $Val extends WifiNetwork>
    implements $WifiNetworkCopyWith<$Res> {
  _$WifiNetworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WifiNetwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = null,
    Object? rssi = null,
    Object? channel = null,
    Object? auth = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      ssid: null == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      auth: null == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WifiNetworkImplCopyWith<$Res>
    implements $WifiNetworkCopyWith<$Res> {
  factory _$$WifiNetworkImplCopyWith(
          _$WifiNetworkImpl value, $Res Function(_$WifiNetworkImpl) then) =
      __$$WifiNetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ssid, int rssi, int channel, String auth, String password});
}

/// @nodoc
class __$$WifiNetworkImplCopyWithImpl<$Res>
    extends _$WifiNetworkCopyWithImpl<$Res, _$WifiNetworkImpl>
    implements _$$WifiNetworkImplCopyWith<$Res> {
  __$$WifiNetworkImplCopyWithImpl(
      _$WifiNetworkImpl _value, $Res Function(_$WifiNetworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of WifiNetwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = null,
    Object? rssi = null,
    Object? channel = null,
    Object? auth = null,
    Object? password = null,
  }) {
    return _then(_$WifiNetworkImpl(
      ssid: null == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      auth: null == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WifiNetworkImpl implements _WifiNetwork {
  _$WifiNetworkImpl(
      {required this.ssid,
      required this.rssi,
      required this.channel,
      required this.auth,
      this.password = ''});

  factory _$WifiNetworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$WifiNetworkImplFromJson(json);

  @override
  final String ssid;
  @override
  final int rssi;
  @override
  final int channel;
// required Uint8List bssid,
  @override
  final String auth;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'WifiNetwork(ssid: $ssid, rssi: $rssi, channel: $channel, auth: $auth, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WifiNetworkImpl &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ssid, rssi, channel, auth, password);

  /// Create a copy of WifiNetwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WifiNetworkImplCopyWith<_$WifiNetworkImpl> get copyWith =>
      __$$WifiNetworkImplCopyWithImpl<_$WifiNetworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WifiNetworkImplToJson(
      this,
    );
  }
}

abstract class _WifiNetwork implements WifiNetwork {
  factory _WifiNetwork(
      {required final String ssid,
      required final int rssi,
      required final int channel,
      required final String auth,
      final String password}) = _$WifiNetworkImpl;

  factory _WifiNetwork.fromJson(Map<String, dynamic> json) =
      _$WifiNetworkImpl.fromJson;

  @override
  String get ssid;
  @override
  int get rssi;
  @override
  int get channel; // required Uint8List bssid,
  @override
  String get auth;
  @override
  String get password;

  /// Create a copy of WifiNetwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WifiNetworkImplCopyWith<_$WifiNetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
