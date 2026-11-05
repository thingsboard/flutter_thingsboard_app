// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_device_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CachedDeviceProfileInfo {

 int? get activeCount; int? get inactiveCount; DeviceProfileInfo get info;
/// Create a copy of CachedDeviceProfileInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedDeviceProfileInfoCopyWith<CachedDeviceProfileInfo> get copyWith => _$CachedDeviceProfileInfoCopyWithImpl<CachedDeviceProfileInfo>(this as CachedDeviceProfileInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedDeviceProfileInfo&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.inactiveCount, inactiveCount) || other.inactiveCount == inactiveCount)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,activeCount,inactiveCount,info);

@override
String toString() {
  return 'CachedDeviceProfileInfo(activeCount: $activeCount, inactiveCount: $inactiveCount, info: $info)';
}


}

/// @nodoc
abstract mixin class $CachedDeviceProfileInfoCopyWith<$Res>  {
  factory $CachedDeviceProfileInfoCopyWith(CachedDeviceProfileInfo value, $Res Function(CachedDeviceProfileInfo) _then) = _$CachedDeviceProfileInfoCopyWithImpl;
@useResult
$Res call({
 int? activeCount, int? inactiveCount, DeviceProfileInfo info
});




}
/// @nodoc
class _$CachedDeviceProfileInfoCopyWithImpl<$Res>
    implements $CachedDeviceProfileInfoCopyWith<$Res> {
  _$CachedDeviceProfileInfoCopyWithImpl(this._self, this._then);

  final CachedDeviceProfileInfo _self;
  final $Res Function(CachedDeviceProfileInfo) _then;

/// Create a copy of CachedDeviceProfileInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeCount = freezed,Object? inactiveCount = freezed,Object? info = null,}) {
  return _then(_self.copyWith(
activeCount: freezed == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int?,inactiveCount: freezed == inactiveCount ? _self.inactiveCount : inactiveCount // ignore: cast_nullable_to_non_nullable
as int?,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as DeviceProfileInfo,
  ));
}

}


/// Adds pattern-matching-related methods to [CachedDeviceProfileInfo].
extension CachedDeviceProfileInfoPatterns on CachedDeviceProfileInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedDeviceProfileInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedDeviceProfileInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedDeviceProfileInfo value)  $default,){
final _that = this;
switch (_that) {
case _CachedDeviceProfileInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedDeviceProfileInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CachedDeviceProfileInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? activeCount,  int? inactiveCount,  DeviceProfileInfo info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedDeviceProfileInfo() when $default != null:
return $default(_that.activeCount,_that.inactiveCount,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? activeCount,  int? inactiveCount,  DeviceProfileInfo info)  $default,) {final _that = this;
switch (_that) {
case _CachedDeviceProfileInfo():
return $default(_that.activeCount,_that.inactiveCount,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? activeCount,  int? inactiveCount,  DeviceProfileInfo info)?  $default,) {final _that = this;
switch (_that) {
case _CachedDeviceProfileInfo() when $default != null:
return $default(_that.activeCount,_that.inactiveCount,_that.info);case _:
  return null;

}
}

}

/// @nodoc


class _CachedDeviceProfileInfo implements CachedDeviceProfileInfo {
  const _CachedDeviceProfileInfo({required this.activeCount, required this.inactiveCount, required this.info});
  

@override final  int? activeCount;
@override final  int? inactiveCount;
@override final  DeviceProfileInfo info;

/// Create a copy of CachedDeviceProfileInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedDeviceProfileInfoCopyWith<_CachedDeviceProfileInfo> get copyWith => __$CachedDeviceProfileInfoCopyWithImpl<_CachedDeviceProfileInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedDeviceProfileInfo&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.inactiveCount, inactiveCount) || other.inactiveCount == inactiveCount)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,activeCount,inactiveCount,info);

@override
String toString() {
  return 'CachedDeviceProfileInfo(activeCount: $activeCount, inactiveCount: $inactiveCount, info: $info)';
}


}

/// @nodoc
abstract mixin class _$CachedDeviceProfileInfoCopyWith<$Res> implements $CachedDeviceProfileInfoCopyWith<$Res> {
  factory _$CachedDeviceProfileInfoCopyWith(_CachedDeviceProfileInfo value, $Res Function(_CachedDeviceProfileInfo) _then) = __$CachedDeviceProfileInfoCopyWithImpl;
@override @useResult
$Res call({
 int? activeCount, int? inactiveCount, DeviceProfileInfo info
});




}
/// @nodoc
class __$CachedDeviceProfileInfoCopyWithImpl<$Res>
    implements _$CachedDeviceProfileInfoCopyWith<$Res> {
  __$CachedDeviceProfileInfoCopyWithImpl(this._self, this._then);

  final _CachedDeviceProfileInfo _self;
  final $Res Function(_CachedDeviceProfileInfo) _then;

/// Create a copy of CachedDeviceProfileInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeCount = freezed,Object? inactiveCount = freezed,Object? info = null,}) {
  return _then(_CachedDeviceProfileInfo(
activeCount: freezed == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int?,inactiveCount: freezed == inactiveCount ? _self.inactiveCount : inactiveCount // ignore: cast_nullable_to_non_nullable
as int?,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as DeviceProfileInfo,
  ));
}


}

// dart format on
