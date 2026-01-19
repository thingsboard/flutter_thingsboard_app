// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_factor_confirm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TwoFactorConfirmState {

 bool get resendAvalible; bool get loading; bool get codeSent; CodeState get codeState;
/// Create a copy of TwoFactorConfirmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TwoFactorConfirmStateCopyWith<TwoFactorConfirmState> get copyWith => _$TwoFactorConfirmStateCopyWithImpl<TwoFactorConfirmState>(this as TwoFactorConfirmState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TwoFactorConfirmState&&(identical(other.resendAvalible, resendAvalible) || other.resendAvalible == resendAvalible)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.codeSent, codeSent) || other.codeSent == codeSent)&&(identical(other.codeState, codeState) || other.codeState == codeState));
}


@override
int get hashCode => Object.hash(runtimeType,resendAvalible,loading,codeSent,codeState);

@override
String toString() {
  return 'TwoFactorConfirmState(resendAvalible: $resendAvalible, loading: $loading, codeSent: $codeSent, codeState: $codeState)';
}


}

/// @nodoc
abstract mixin class $TwoFactorConfirmStateCopyWith<$Res>  {
  factory $TwoFactorConfirmStateCopyWith(TwoFactorConfirmState value, $Res Function(TwoFactorConfirmState) _then) = _$TwoFactorConfirmStateCopyWithImpl;
@useResult
$Res call({
 bool resendAvalible, bool loading, bool codeSent, CodeState codeState
});




}
/// @nodoc
class _$TwoFactorConfirmStateCopyWithImpl<$Res>
    implements $TwoFactorConfirmStateCopyWith<$Res> {
  _$TwoFactorConfirmStateCopyWithImpl(this._self, this._then);

  final TwoFactorConfirmState _self;
  final $Res Function(TwoFactorConfirmState) _then;

/// Create a copy of TwoFactorConfirmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resendAvalible = null,Object? loading = null,Object? codeSent = null,Object? codeState = null,}) {
  return _then(_self.copyWith(
resendAvalible: null == resendAvalible ? _self.resendAvalible : resendAvalible // ignore: cast_nullable_to_non_nullable
as bool,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,codeSent: null == codeSent ? _self.codeSent : codeSent // ignore: cast_nullable_to_non_nullable
as bool,codeState: null == codeState ? _self.codeState : codeState // ignore: cast_nullable_to_non_nullable
as CodeState,
  ));
}

}


/// Adds pattern-matching-related methods to [TwoFactorConfirmState].
extension TwoFactorConfirmStatePatterns on TwoFactorConfirmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TwoFactorConfirmState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TwoFactorConfirmState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TwoFactorConfirmState value)  $default,){
final _that = this;
switch (_that) {
case _TwoFactorConfirmState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TwoFactorConfirmState value)?  $default,){
final _that = this;
switch (_that) {
case _TwoFactorConfirmState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool resendAvalible,  bool loading,  bool codeSent,  CodeState codeState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TwoFactorConfirmState() when $default != null:
return $default(_that.resendAvalible,_that.loading,_that.codeSent,_that.codeState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool resendAvalible,  bool loading,  bool codeSent,  CodeState codeState)  $default,) {final _that = this;
switch (_that) {
case _TwoFactorConfirmState():
return $default(_that.resendAvalible,_that.loading,_that.codeSent,_that.codeState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool resendAvalible,  bool loading,  bool codeSent,  CodeState codeState)?  $default,) {final _that = this;
switch (_that) {
case _TwoFactorConfirmState() when $default != null:
return $default(_that.resendAvalible,_that.loading,_that.codeSent,_that.codeState);case _:
  return null;

}
}

}

/// @nodoc


class _TwoFactorConfirmState implements TwoFactorConfirmState {
  const _TwoFactorConfirmState({required this.resendAvalible, required this.loading, required this.codeSent, required this.codeState});
  

@override final  bool resendAvalible;
@override final  bool loading;
@override final  bool codeSent;
@override final  CodeState codeState;

/// Create a copy of TwoFactorConfirmState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorConfirmStateCopyWith<_TwoFactorConfirmState> get copyWith => __$TwoFactorConfirmStateCopyWithImpl<_TwoFactorConfirmState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorConfirmState&&(identical(other.resendAvalible, resendAvalible) || other.resendAvalible == resendAvalible)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.codeSent, codeSent) || other.codeSent == codeSent)&&(identical(other.codeState, codeState) || other.codeState == codeState));
}


@override
int get hashCode => Object.hash(runtimeType,resendAvalible,loading,codeSent,codeState);

@override
String toString() {
  return 'TwoFactorConfirmState(resendAvalible: $resendAvalible, loading: $loading, codeSent: $codeSent, codeState: $codeState)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorConfirmStateCopyWith<$Res> implements $TwoFactorConfirmStateCopyWith<$Res> {
  factory _$TwoFactorConfirmStateCopyWith(_TwoFactorConfirmState value, $Res Function(_TwoFactorConfirmState) _then) = __$TwoFactorConfirmStateCopyWithImpl;
@override @useResult
$Res call({
 bool resendAvalible, bool loading, bool codeSent, CodeState codeState
});




}
/// @nodoc
class __$TwoFactorConfirmStateCopyWithImpl<$Res>
    implements _$TwoFactorConfirmStateCopyWith<$Res> {
  __$TwoFactorConfirmStateCopyWithImpl(this._self, this._then);

  final _TwoFactorConfirmState _self;
  final $Res Function(_TwoFactorConfirmState) _then;

/// Create a copy of TwoFactorConfirmState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resendAvalible = null,Object? loading = null,Object? codeSent = null,Object? codeState = null,}) {
  return _then(_TwoFactorConfirmState(
resendAvalible: null == resendAvalible ? _self.resendAvalible : resendAvalible // ignore: cast_nullable_to_non_nullable
as bool,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,codeSent: null == codeSent ? _self.codeSent : codeSent // ignore: cast_nullable_to_non_nullable
as bool,codeState: null == codeState ? _self.codeState : codeState // ignore: cast_nullable_to_non_nullable
as CodeState,
  ));
}


}

// dart format on
