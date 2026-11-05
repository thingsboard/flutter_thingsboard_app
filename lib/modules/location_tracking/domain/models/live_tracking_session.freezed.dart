// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_tracking_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveTrackingSession {

 LiveTrackingConfig get config; LiveTrackingStatus get status; DateTime get startedAt; int get fixCount; int get savedCount; int get saveErrorCount; GeoPosition? get lastFix; LiveTrackingError? get lastError;
/// Create a copy of LiveTrackingSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveTrackingSessionCopyWith<LiveTrackingSession> get copyWith => _$LiveTrackingSessionCopyWithImpl<LiveTrackingSession>(this as LiveTrackingSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveTrackingSession&&(identical(other.config, config) || other.config == config)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.fixCount, fixCount) || other.fixCount == fixCount)&&(identical(other.savedCount, savedCount) || other.savedCount == savedCount)&&(identical(other.saveErrorCount, saveErrorCount) || other.saveErrorCount == saveErrorCount)&&(identical(other.lastFix, lastFix) || other.lastFix == lastFix)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}


@override
int get hashCode => Object.hash(runtimeType,config,status,startedAt,fixCount,savedCount,saveErrorCount,lastFix,lastError);

@override
String toString() {
  return 'LiveTrackingSession(config: $config, status: $status, startedAt: $startedAt, fixCount: $fixCount, savedCount: $savedCount, saveErrorCount: $saveErrorCount, lastFix: $lastFix, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class $LiveTrackingSessionCopyWith<$Res>  {
  factory $LiveTrackingSessionCopyWith(LiveTrackingSession value, $Res Function(LiveTrackingSession) _then) = _$LiveTrackingSessionCopyWithImpl;
@useResult
$Res call({
 LiveTrackingConfig config, LiveTrackingStatus status, DateTime startedAt, int fixCount, int savedCount, int saveErrorCount, GeoPosition? lastFix, LiveTrackingError? lastError
});


$GeoPositionCopyWith<$Res>? get lastFix;

}
/// @nodoc
class _$LiveTrackingSessionCopyWithImpl<$Res>
    implements $LiveTrackingSessionCopyWith<$Res> {
  _$LiveTrackingSessionCopyWithImpl(this._self, this._then);

  final LiveTrackingSession _self;
  final $Res Function(LiveTrackingSession) _then;

/// Create a copy of LiveTrackingSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = null,Object? status = null,Object? startedAt = null,Object? fixCount = null,Object? savedCount = null,Object? saveErrorCount = null,Object? lastFix = freezed,Object? lastError = freezed,}) {
  return _then(_self.copyWith(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as LiveTrackingConfig,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveTrackingStatus,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fixCount: null == fixCount ? _self.fixCount : fixCount // ignore: cast_nullable_to_non_nullable
as int,savedCount: null == savedCount ? _self.savedCount : savedCount // ignore: cast_nullable_to_non_nullable
as int,saveErrorCount: null == saveErrorCount ? _self.saveErrorCount : saveErrorCount // ignore: cast_nullable_to_non_nullable
as int,lastFix: freezed == lastFix ? _self.lastFix : lastFix // ignore: cast_nullable_to_non_nullable
as GeoPosition?,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as LiveTrackingError?,
  ));
}
/// Create a copy of LiveTrackingSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPositionCopyWith<$Res>? get lastFix {
    if (_self.lastFix == null) {
    return null;
  }

  return $GeoPositionCopyWith<$Res>(_self.lastFix!, (value) {
    return _then(_self.copyWith(lastFix: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveTrackingSession].
extension LiveTrackingSessionPatterns on LiveTrackingSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveTrackingSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveTrackingSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveTrackingSession value)  $default,){
final _that = this;
switch (_that) {
case _LiveTrackingSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveTrackingSession value)?  $default,){
final _that = this;
switch (_that) {
case _LiveTrackingSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LiveTrackingConfig config,  LiveTrackingStatus status,  DateTime startedAt,  int fixCount,  int savedCount,  int saveErrorCount,  GeoPosition? lastFix,  LiveTrackingError? lastError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveTrackingSession() when $default != null:
return $default(_that.config,_that.status,_that.startedAt,_that.fixCount,_that.savedCount,_that.saveErrorCount,_that.lastFix,_that.lastError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LiveTrackingConfig config,  LiveTrackingStatus status,  DateTime startedAt,  int fixCount,  int savedCount,  int saveErrorCount,  GeoPosition? lastFix,  LiveTrackingError? lastError)  $default,) {final _that = this;
switch (_that) {
case _LiveTrackingSession():
return $default(_that.config,_that.status,_that.startedAt,_that.fixCount,_that.savedCount,_that.saveErrorCount,_that.lastFix,_that.lastError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LiveTrackingConfig config,  LiveTrackingStatus status,  DateTime startedAt,  int fixCount,  int savedCount,  int saveErrorCount,  GeoPosition? lastFix,  LiveTrackingError? lastError)?  $default,) {final _that = this;
switch (_that) {
case _LiveTrackingSession() when $default != null:
return $default(_that.config,_that.status,_that.startedAt,_that.fixCount,_that.savedCount,_that.saveErrorCount,_that.lastFix,_that.lastError);case _:
  return null;

}
}

}

/// @nodoc


class _LiveTrackingSession implements LiveTrackingSession {
  const _LiveTrackingSession({required this.config, required this.status, required this.startedAt, this.fixCount = 0, this.savedCount = 0, this.saveErrorCount = 0, this.lastFix, this.lastError});
  

@override final  LiveTrackingConfig config;
@override final  LiveTrackingStatus status;
@override final  DateTime startedAt;
@override@JsonKey() final  int fixCount;
@override@JsonKey() final  int savedCount;
@override@JsonKey() final  int saveErrorCount;
@override final  GeoPosition? lastFix;
@override final  LiveTrackingError? lastError;

/// Create a copy of LiveTrackingSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveTrackingSessionCopyWith<_LiveTrackingSession> get copyWith => __$LiveTrackingSessionCopyWithImpl<_LiveTrackingSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveTrackingSession&&(identical(other.config, config) || other.config == config)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.fixCount, fixCount) || other.fixCount == fixCount)&&(identical(other.savedCount, savedCount) || other.savedCount == savedCount)&&(identical(other.saveErrorCount, saveErrorCount) || other.saveErrorCount == saveErrorCount)&&(identical(other.lastFix, lastFix) || other.lastFix == lastFix)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}


@override
int get hashCode => Object.hash(runtimeType,config,status,startedAt,fixCount,savedCount,saveErrorCount,lastFix,lastError);

@override
String toString() {
  return 'LiveTrackingSession(config: $config, status: $status, startedAt: $startedAt, fixCount: $fixCount, savedCount: $savedCount, saveErrorCount: $saveErrorCount, lastFix: $lastFix, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class _$LiveTrackingSessionCopyWith<$Res> implements $LiveTrackingSessionCopyWith<$Res> {
  factory _$LiveTrackingSessionCopyWith(_LiveTrackingSession value, $Res Function(_LiveTrackingSession) _then) = __$LiveTrackingSessionCopyWithImpl;
@override @useResult
$Res call({
 LiveTrackingConfig config, LiveTrackingStatus status, DateTime startedAt, int fixCount, int savedCount, int saveErrorCount, GeoPosition? lastFix, LiveTrackingError? lastError
});


@override $GeoPositionCopyWith<$Res>? get lastFix;

}
/// @nodoc
class __$LiveTrackingSessionCopyWithImpl<$Res>
    implements _$LiveTrackingSessionCopyWith<$Res> {
  __$LiveTrackingSessionCopyWithImpl(this._self, this._then);

  final _LiveTrackingSession _self;
  final $Res Function(_LiveTrackingSession) _then;

/// Create a copy of LiveTrackingSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = null,Object? status = null,Object? startedAt = null,Object? fixCount = null,Object? savedCount = null,Object? saveErrorCount = null,Object? lastFix = freezed,Object? lastError = freezed,}) {
  return _then(_LiveTrackingSession(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as LiveTrackingConfig,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveTrackingStatus,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fixCount: null == fixCount ? _self.fixCount : fixCount // ignore: cast_nullable_to_non_nullable
as int,savedCount: null == savedCount ? _self.savedCount : savedCount // ignore: cast_nullable_to_non_nullable
as int,saveErrorCount: null == saveErrorCount ? _self.saveErrorCount : saveErrorCount // ignore: cast_nullable_to_non_nullable
as int,lastFix: freezed == lastFix ? _self.lastFix : lastFix // ignore: cast_nullable_to_non_nullable
as GeoPosition?,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as LiveTrackingError?,
  ));
}

/// Create a copy of LiveTrackingSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPositionCopyWith<$Res>? get lastFix {
    if (_self.lastFix == null) {
    return null;
  }

  return $GeoPositionCopyWith<$Res>(_self.lastFix!, (value) {
    return _then(_self.copyWith(lastFix: value));
  });
}
}

// dart format on
