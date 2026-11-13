// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoPosition {

 double get latitude; double get longitude; double get accuracy; DateTime get timestamp; double get altitude; double get speed; double get heading;
/// Create a copy of GeoPosition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoPositionCopyWith<GeoPosition> get copyWith => _$GeoPositionCopyWithImpl<GeoPosition>(this as GeoPosition, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GeoPosition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoPosition&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&(identical(other.altitude, _this.altitude) || other.altitude == _this.altitude)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.heading, _this.heading) || other.heading == _this.heading));
}


@override
int get hashCode {
  final _this = this as GeoPosition;
  return Object.hash(runtimeType,_this.latitude,_this.longitude,_this.accuracy,_this.timestamp,_this.altitude,_this.speed,_this.heading);
}

@override
String toString() {
  final _this = this as GeoPosition;
  return 'GeoPosition(latitude: ${_this.latitude}, longitude: ${_this.longitude}, accuracy: ${_this.accuracy}, timestamp: ${_this.timestamp}, altitude: ${_this.altitude}, speed: ${_this.speed}, heading: ${_this.heading})';
}


}

/// @nodoc
abstract mixin class $GeoPositionCopyWith<$Res>  {
  factory $GeoPositionCopyWith(GeoPosition value, $Res Function(GeoPosition) _then) = _$GeoPositionCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, double accuracy, DateTime timestamp, double altitude, double speed, double heading
});




}
/// @nodoc
class _$GeoPositionCopyWithImpl<$Res>
    implements $GeoPositionCopyWith<$Res> {
  _$GeoPositionCopyWithImpl(this._self, this._then);

  final GeoPosition _self;
  final $Res Function(GeoPosition) _then;

/// Create a copy of GeoPosition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = null,Object? timestamp = null,Object? altitude = null,Object? speed = null,Object? heading = null,}) {
  return _then(GeoPosition(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,altitude: null == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoPosition].
extension GeoPositionPatterns on GeoPosition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoPosition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoPosition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoPosition value)  $default,){
final _that = this;
switch (_that) {
case _GeoPosition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoPosition value)?  $default,){
final _that = this;
switch (_that) {
case _GeoPosition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double accuracy,  DateTime timestamp,  double altitude,  double speed,  double heading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoPosition() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.timestamp,_that.altitude,_that.speed,_that.heading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double accuracy,  DateTime timestamp,  double altitude,  double speed,  double heading)  $default,) {final _that = this;
switch (_that) {
case _GeoPosition():
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.timestamp,_that.altitude,_that.speed,_that.heading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  double accuracy,  DateTime timestamp,  double altitude,  double speed,  double heading)?  $default,) {final _that = this;
switch (_that) {
case _GeoPosition() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.timestamp,_that.altitude,_that.speed,_that.heading);case _:
  return null;

}
}

}

/// @nodoc


class _GeoPosition implements GeoPosition {
  const _GeoPosition({required this.latitude, required this.longitude, required this.accuracy, required this.timestamp, required this.altitude, required this.speed, required this.heading});
  

@override final  double latitude;
@override final  double longitude;
@override final  double accuracy;
@override final  DateTime timestamp;
@override final  double altitude;
@override final  double speed;
@override final  double heading;

/// Create a copy of GeoPosition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoPositionCopyWith<_GeoPosition> get copyWith => __$GeoPositionCopyWithImpl<_GeoPosition>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoPosition&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading));
}


@override
int get hashCode {
    return Object.hash(runtimeType,latitude,longitude,accuracy,timestamp,altitude,speed,heading);
}

@override
String toString() {
    return 'GeoPosition(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, timestamp: $timestamp, altitude: $altitude, speed: $speed, heading: $heading)';
}


}

/// @nodoc
abstract mixin class _$GeoPositionCopyWith<$Res> implements $GeoPositionCopyWith<$Res> {
  factory _$GeoPositionCopyWith(_GeoPosition value, $Res Function(_GeoPosition) _then) = __$GeoPositionCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, double accuracy, DateTime timestamp, double altitude, double speed, double heading
});




}
/// @nodoc
class __$GeoPositionCopyWithImpl<$Res>
    implements _$GeoPositionCopyWith<$Res> {
  __$GeoPositionCopyWithImpl(this._self, this._then);

  final _GeoPosition _self;
  final $Res Function(_GeoPosition) _then;

/// Create a copy of GeoPosition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = null,Object? timestamp = null,Object? altitude = null,Object? speed = null,Object? heading = null,}) {
  return _then(_GeoPosition(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,altitude: null == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
