// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_tracking_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveTrackingViewState {

 LiveTrackingSession? get session; bool get hidden;
/// Create a copy of LiveTrackingViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveTrackingViewStateCopyWith<LiveTrackingViewState> get copyWith => _$LiveTrackingViewStateCopyWithImpl<LiveTrackingViewState>(this as LiveTrackingViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveTrackingViewState&&(identical(other.session, session) || other.session == session)&&(identical(other.hidden, hidden) || other.hidden == hidden));
}


@override
int get hashCode => Object.hash(runtimeType,session,hidden);

@override
String toString() {
  return 'LiveTrackingViewState(session: $session, hidden: $hidden)';
}


}

/// @nodoc
abstract mixin class $LiveTrackingViewStateCopyWith<$Res>  {
  factory $LiveTrackingViewStateCopyWith(LiveTrackingViewState value, $Res Function(LiveTrackingViewState) _then) = _$LiveTrackingViewStateCopyWithImpl;
@useResult
$Res call({
 LiveTrackingSession? session, bool hidden
});


$LiveTrackingSessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$LiveTrackingViewStateCopyWithImpl<$Res>
    implements $LiveTrackingViewStateCopyWith<$Res> {
  _$LiveTrackingViewStateCopyWithImpl(this._self, this._then);

  final LiveTrackingViewState _self;
  final $Res Function(LiveTrackingViewState) _then;

/// Create a copy of LiveTrackingViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = freezed,Object? hidden = null,}) {
  return _then(_self.copyWith(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LiveTrackingSession?,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LiveTrackingViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveTrackingSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $LiveTrackingSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveTrackingViewState].
extension LiveTrackingViewStatePatterns on LiveTrackingViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveTrackingViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveTrackingViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveTrackingViewState value)  $default,){
final _that = this;
switch (_that) {
case _LiveTrackingViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveTrackingViewState value)?  $default,){
final _that = this;
switch (_that) {
case _LiveTrackingViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LiveTrackingSession? session,  bool hidden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveTrackingViewState() when $default != null:
return $default(_that.session,_that.hidden);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LiveTrackingSession? session,  bool hidden)  $default,) {final _that = this;
switch (_that) {
case _LiveTrackingViewState():
return $default(_that.session,_that.hidden);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LiveTrackingSession? session,  bool hidden)?  $default,) {final _that = this;
switch (_that) {
case _LiveTrackingViewState() when $default != null:
return $default(_that.session,_that.hidden);case _:
  return null;

}
}

}

/// @nodoc


class _LiveTrackingViewState implements LiveTrackingViewState {
  const _LiveTrackingViewState({this.session, this.hidden = false});
  

@override final  LiveTrackingSession? session;
@override@JsonKey() final  bool hidden;

/// Create a copy of LiveTrackingViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveTrackingViewStateCopyWith<_LiveTrackingViewState> get copyWith => __$LiveTrackingViewStateCopyWithImpl<_LiveTrackingViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveTrackingViewState&&(identical(other.session, session) || other.session == session)&&(identical(other.hidden, hidden) || other.hidden == hidden));
}


@override
int get hashCode => Object.hash(runtimeType,session,hidden);

@override
String toString() {
  return 'LiveTrackingViewState(session: $session, hidden: $hidden)';
}


}

/// @nodoc
abstract mixin class _$LiveTrackingViewStateCopyWith<$Res> implements $LiveTrackingViewStateCopyWith<$Res> {
  factory _$LiveTrackingViewStateCopyWith(_LiveTrackingViewState value, $Res Function(_LiveTrackingViewState) _then) = __$LiveTrackingViewStateCopyWithImpl;
@override @useResult
$Res call({
 LiveTrackingSession? session, bool hidden
});


@override $LiveTrackingSessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$LiveTrackingViewStateCopyWithImpl<$Res>
    implements _$LiveTrackingViewStateCopyWith<$Res> {
  __$LiveTrackingViewStateCopyWithImpl(this._self, this._then);

  final _LiveTrackingViewState _self;
  final $Res Function(_LiveTrackingViewState) _then;

/// Create a copy of LiveTrackingViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? hidden = null,}) {
  return _then(_LiveTrackingViewState(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LiveTrackingSession?,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LiveTrackingViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveTrackingSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $LiveTrackingSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
