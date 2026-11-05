// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WifiNetwork {

 String get ssid; int get rssi; int get channel;// required Uint8List bssid,
 String get auth; String get password;
/// Create a copy of WifiNetwork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiNetworkCopyWith<WifiNetwork> get copyWith => _$WifiNetworkCopyWithImpl<WifiNetwork>(this as WifiNetwork, _$identity);

  /// Serializes this WifiNetwork to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiNetwork&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,channel,auth,password);

@override
String toString() {
  return 'WifiNetwork(ssid: $ssid, rssi: $rssi, channel: $channel, auth: $auth, password: $password)';
}


}

/// @nodoc
abstract mixin class $WifiNetworkCopyWith<$Res>  {
  factory $WifiNetworkCopyWith(WifiNetwork value, $Res Function(WifiNetwork) _then) = _$WifiNetworkCopyWithImpl;
@useResult
$Res call({
 String ssid, int rssi, int channel, String auth, String password
});




}
/// @nodoc
class _$WifiNetworkCopyWithImpl<$Res>
    implements $WifiNetworkCopyWith<$Res> {
  _$WifiNetworkCopyWithImpl(this._self, this._then);

  final WifiNetwork _self;
  final $Res Function(WifiNetwork) _then;

/// Create a copy of WifiNetwork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ssid = null,Object? rssi = null,Object? channel = null,Object? auth = null,Object? password = null,}) {
  return _then(_self.copyWith(
ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiNetwork].
extension WifiNetworkPatterns on WifiNetwork {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiNetwork value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiNetwork() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiNetwork value)  $default,){
final _that = this;
switch (_that) {
case _WifiNetwork():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiNetwork value)?  $default,){
final _that = this;
switch (_that) {
case _WifiNetwork() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ssid,  int rssi,  int channel,  String auth,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiNetwork() when $default != null:
return $default(_that.ssid,_that.rssi,_that.channel,_that.auth,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ssid,  int rssi,  int channel,  String auth,  String password)  $default,) {final _that = this;
switch (_that) {
case _WifiNetwork():
return $default(_that.ssid,_that.rssi,_that.channel,_that.auth,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ssid,  int rssi,  int channel,  String auth,  String password)?  $default,) {final _that = this;
switch (_that) {
case _WifiNetwork() when $default != null:
return $default(_that.ssid,_that.rssi,_that.channel,_that.auth,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WifiNetwork implements WifiNetwork {
  const _WifiNetwork({required this.ssid, required this.rssi, required this.channel, required this.auth, this.password = ''});
  factory _WifiNetwork.fromJson(Map<String, dynamic> json) => _$WifiNetworkFromJson(json);

@override final  String ssid;
@override final  int rssi;
@override final  int channel;
// required Uint8List bssid,
@override final  String auth;
@override@JsonKey() final  String password;

/// Create a copy of WifiNetwork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiNetworkCopyWith<_WifiNetwork> get copyWith => __$WifiNetworkCopyWithImpl<_WifiNetwork>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WifiNetworkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiNetwork&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,channel,auth,password);

@override
String toString() {
  return 'WifiNetwork(ssid: $ssid, rssi: $rssi, channel: $channel, auth: $auth, password: $password)';
}


}

/// @nodoc
abstract mixin class _$WifiNetworkCopyWith<$Res> implements $WifiNetworkCopyWith<$Res> {
  factory _$WifiNetworkCopyWith(_WifiNetwork value, $Res Function(_WifiNetwork) _then) = __$WifiNetworkCopyWithImpl;
@override @useResult
$Res call({
 String ssid, int rssi, int channel, String auth, String password
});




}
/// @nodoc
class __$WifiNetworkCopyWithImpl<$Res>
    implements _$WifiNetworkCopyWith<$Res> {
  __$WifiNetworkCopyWithImpl(this._self, this._then);

  final _WifiNetwork _self;
  final $Res Function(_WifiNetwork) _then;

/// Create a copy of WifiNetwork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ssid = null,Object? rssi = null,Object? channel = null,Object? auth = null,Object? password = null,}) {
  return _then(_WifiNetwork(
ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
