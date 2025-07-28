// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_endpoint_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SwitchEndpointArgs {

 String get secret; String? get host; String? get ttl;@JsonKey(fromJson: fromFluroData, toJson: uriToJson) Uri get uri;
/// Create a copy of SwitchEndpointArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwitchEndpointArgsCopyWith<SwitchEndpointArgs> get copyWith => _$SwitchEndpointArgsCopyWithImpl<SwitchEndpointArgs>(this as SwitchEndpointArgs, _$identity);

  /// Serializes this SwitchEndpointArgs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwitchEndpointArgs&&(identical(other.secret, secret) || other.secret == secret)&&(identical(other.host, host) || other.host == host)&&(identical(other.ttl, ttl) || other.ttl == ttl)&&(identical(other.uri, uri) || other.uri == uri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secret,host,ttl,uri);

@override
String toString() {
  return 'SwitchEndpointArgs(secret: $secret, host: $host, ttl: $ttl, uri: $uri)';
}


}

/// @nodoc
abstract mixin class $SwitchEndpointArgsCopyWith<$Res>  {
  factory $SwitchEndpointArgsCopyWith(SwitchEndpointArgs value, $Res Function(SwitchEndpointArgs) _then) = _$SwitchEndpointArgsCopyWithImpl;
@useResult
$Res call({
 String secret, String? host, String? ttl,@JsonKey(fromJson: fromFluroData, toJson: uriToJson) Uri uri
});




}
/// @nodoc
class _$SwitchEndpointArgsCopyWithImpl<$Res>
    implements $SwitchEndpointArgsCopyWith<$Res> {
  _$SwitchEndpointArgsCopyWithImpl(this._self, this._then);

  final SwitchEndpointArgs _self;
  final $Res Function(SwitchEndpointArgs) _then;

/// Create a copy of SwitchEndpointArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secret = null,Object? host = freezed,Object? ttl = freezed,Object? uri = null,}) {
  return _then(_self.copyWith(
secret: null == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as String,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,ttl: freezed == ttl ? _self.ttl : ttl // ignore: cast_nullable_to_non_nullable
as String?,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}

}


/// Adds pattern-matching-related methods to [SwitchEndpointArgs].
extension SwitchEndpointArgsPatterns on SwitchEndpointArgs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwitchEndpointArgs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwitchEndpointArgs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwitchEndpointArgs value)  $default,){
final _that = this;
switch (_that) {
case _SwitchEndpointArgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwitchEndpointArgs value)?  $default,){
final _that = this;
switch (_that) {
case _SwitchEndpointArgs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String secret,  String? host,  String? ttl, @JsonKey(fromJson: fromFluroData, toJson: uriToJson)  Uri uri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwitchEndpointArgs() when $default != null:
return $default(_that.secret,_that.host,_that.ttl,_that.uri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String secret,  String? host,  String? ttl, @JsonKey(fromJson: fromFluroData, toJson: uriToJson)  Uri uri)  $default,) {final _that = this;
switch (_that) {
case _SwitchEndpointArgs():
return $default(_that.secret,_that.host,_that.ttl,_that.uri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String secret,  String? host,  String? ttl, @JsonKey(fromJson: fromFluroData, toJson: uriToJson)  Uri uri)?  $default,) {final _that = this;
switch (_that) {
case _SwitchEndpointArgs() when $default != null:
return $default(_that.secret,_that.host,_that.ttl,_that.uri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SwitchEndpointArgs implements SwitchEndpointArgs {
  const _SwitchEndpointArgs({required this.secret, this.host, this.ttl, @JsonKey(fromJson: fromFluroData, toJson: uriToJson) required this.uri});
  factory _SwitchEndpointArgs.fromJson(Map<String, dynamic> json) => _$SwitchEndpointArgsFromJson(json);

@override final  String secret;
@override final  String? host;
@override final  String? ttl;
@override@JsonKey(fromJson: fromFluroData, toJson: uriToJson) final  Uri uri;

/// Create a copy of SwitchEndpointArgs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwitchEndpointArgsCopyWith<_SwitchEndpointArgs> get copyWith => __$SwitchEndpointArgsCopyWithImpl<_SwitchEndpointArgs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SwitchEndpointArgsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwitchEndpointArgs&&(identical(other.secret, secret) || other.secret == secret)&&(identical(other.host, host) || other.host == host)&&(identical(other.ttl, ttl) || other.ttl == ttl)&&(identical(other.uri, uri) || other.uri == uri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secret,host,ttl,uri);

@override
String toString() {
  return 'SwitchEndpointArgs(secret: $secret, host: $host, ttl: $ttl, uri: $uri)';
}


}

/// @nodoc
abstract mixin class _$SwitchEndpointArgsCopyWith<$Res> implements $SwitchEndpointArgsCopyWith<$Res> {
  factory _$SwitchEndpointArgsCopyWith(_SwitchEndpointArgs value, $Res Function(_SwitchEndpointArgs) _then) = __$SwitchEndpointArgsCopyWithImpl;
@override @useResult
$Res call({
 String secret, String? host, String? ttl,@JsonKey(fromJson: fromFluroData, toJson: uriToJson) Uri uri
});




}
/// @nodoc
class __$SwitchEndpointArgsCopyWithImpl<$Res>
    implements _$SwitchEndpointArgsCopyWith<$Res> {
  __$SwitchEndpointArgsCopyWithImpl(this._self, this._then);

  final _SwitchEndpointArgs _self;
  final $Res Function(_SwitchEndpointArgs) _then;

/// Create a copy of SwitchEndpointArgs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secret = null,Object? host = freezed,Object? ttl = freezed,Object? uri = null,}) {
  return _then(_SwitchEndpointArgs(
secret: null == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as String,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,ttl: freezed == ttl ? _self.ttl : ttl // ignore: cast_nullable_to_non_nullable
as String?,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}


}

// dart format on
