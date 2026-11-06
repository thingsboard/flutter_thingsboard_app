// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wl_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WlState {

 LoginWhiteLabelingParams get loginWhiteLabelingParams; WhiteLabelingParams get userParams; ThemeData get theme;/// The login page look, built from the login white-labeling. Kept apart
/// from [theme] so the login page shown right after a logout does not
/// inherit the signed-out user's palette.
 ThemeData get loginTheme; bool get isUserWlMode; Widget get logo;
/// Create a copy of WlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WlStateCopyWith<WlState> get copyWith => _$WlStateCopyWithImpl<WlState>(this as WlState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WlState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WlState&&(identical(other.loginWhiteLabelingParams, _this.loginWhiteLabelingParams) || other.loginWhiteLabelingParams == _this.loginWhiteLabelingParams)&&(identical(other.userParams, _this.userParams) || other.userParams == _this.userParams)&&(identical(other.theme, _this.theme) || other.theme == _this.theme)&&(identical(other.loginTheme, _this.loginTheme) || other.loginTheme == _this.loginTheme)&&(identical(other.isUserWlMode, _this.isUserWlMode) || other.isUserWlMode == _this.isUserWlMode)&&(identical(other.logo, _this.logo) || other.logo == _this.logo));
}


@override
int get hashCode {
  final _this = this as WlState;
  return Object.hash(runtimeType,_this.loginWhiteLabelingParams,_this.userParams,_this.theme,_this.loginTheme,_this.isUserWlMode,_this.logo);
}

@override
String toString() {
  final _this = this as WlState;
  return 'WlState(loginWhiteLabelingParams: ${_this.loginWhiteLabelingParams}, userParams: ${_this.userParams}, theme: ${_this.theme}, loginTheme: ${_this.loginTheme}, isUserWlMode: ${_this.isUserWlMode}, logo: ${_this.logo})';
}


}

/// @nodoc
abstract mixin class $WlStateCopyWith<$Res>  {
  factory $WlStateCopyWith(WlState value, $Res Function(WlState) _then) = _$WlStateCopyWithImpl;
@useResult
$Res call({
 LoginWhiteLabelingParams loginWhiteLabelingParams, WhiteLabelingParams userParams, ThemeData theme, ThemeData loginTheme, bool isUserWlMode, Widget logo
});




}
/// @nodoc
class _$WlStateCopyWithImpl<$Res>
    implements $WlStateCopyWith<$Res> {
  _$WlStateCopyWithImpl(this._self, this._then);

  final WlState _self;
  final $Res Function(WlState) _then;

/// Create a copy of WlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginWhiteLabelingParams = null,Object? userParams = null,Object? theme = null,Object? loginTheme = null,Object? isUserWlMode = null,Object? logo = null,}) {
  return _then(WlState(
loginWhiteLabelingParams: null == loginWhiteLabelingParams ? _self.loginWhiteLabelingParams : loginWhiteLabelingParams // ignore: cast_nullable_to_non_nullable
as LoginWhiteLabelingParams,userParams: null == userParams ? _self.userParams : userParams // ignore: cast_nullable_to_non_nullable
as WhiteLabelingParams,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemeData,loginTheme: null == loginTheme ? _self.loginTheme : loginTheme // ignore: cast_nullable_to_non_nullable
as ThemeData,isUserWlMode: null == isUserWlMode ? _self.isUserWlMode : isUserWlMode // ignore: cast_nullable_to_non_nullable
as bool,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}

}


/// Adds pattern-matching-related methods to [WlState].
extension WlStatePatterns on WlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WlState value)  $default,){
final _that = this;
switch (_that) {
case _WlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WlState value)?  $default,){
final _that = this;
switch (_that) {
case _WlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginWhiteLabelingParams loginWhiteLabelingParams,  WhiteLabelingParams userParams,  ThemeData theme,  ThemeData loginTheme,  bool isUserWlMode,  Widget logo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WlState() when $default != null:
return $default(_that.loginWhiteLabelingParams,_that.userParams,_that.theme,_that.loginTheme,_that.isUserWlMode,_that.logo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginWhiteLabelingParams loginWhiteLabelingParams,  WhiteLabelingParams userParams,  ThemeData theme,  ThemeData loginTheme,  bool isUserWlMode,  Widget logo)  $default,) {final _that = this;
switch (_that) {
case _WlState():
return $default(_that.loginWhiteLabelingParams,_that.userParams,_that.theme,_that.loginTheme,_that.isUserWlMode,_that.logo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginWhiteLabelingParams loginWhiteLabelingParams,  WhiteLabelingParams userParams,  ThemeData theme,  ThemeData loginTheme,  bool isUserWlMode,  Widget logo)?  $default,) {final _that = this;
switch (_that) {
case _WlState() when $default != null:
return $default(_that.loginWhiteLabelingParams,_that.userParams,_that.theme,_that.loginTheme,_that.isUserWlMode,_that.logo);case _:
  return null;

}
}

}

/// @nodoc


class _WlState extends WlState {
  const _WlState({required this.loginWhiteLabelingParams, required this.userParams, required this.theme, required this.loginTheme, required this.isUserWlMode, required this.logo}): super._();
  

@override final  LoginWhiteLabelingParams loginWhiteLabelingParams;
@override final  WhiteLabelingParams userParams;
@override final  ThemeData theme;
/// The login page look, built from the login white-labeling. Kept apart
/// from [theme] so the login page shown right after a logout does not
/// inherit the signed-out user's palette.
@override final  ThemeData loginTheme;
@override final  bool isUserWlMode;
@override final  Widget logo;

/// Create a copy of WlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WlStateCopyWith<_WlState> get copyWith => __$WlStateCopyWithImpl<_WlState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WlState&&(identical(other.loginWhiteLabelingParams, loginWhiteLabelingParams) || other.loginWhiteLabelingParams == loginWhiteLabelingParams)&&(identical(other.userParams, userParams) || other.userParams == userParams)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.loginTheme, loginTheme) || other.loginTheme == loginTheme)&&(identical(other.isUserWlMode, isUserWlMode) || other.isUserWlMode == isUserWlMode)&&(identical(other.logo, logo) || other.logo == logo));
}


@override
int get hashCode {
    return Object.hash(runtimeType,loginWhiteLabelingParams,userParams,theme,loginTheme,isUserWlMode,logo);
}

@override
String toString() {
    return 'WlState(loginWhiteLabelingParams: $loginWhiteLabelingParams, userParams: $userParams, theme: $theme, loginTheme: $loginTheme, isUserWlMode: $isUserWlMode, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$WlStateCopyWith<$Res> implements $WlStateCopyWith<$Res> {
  factory _$WlStateCopyWith(_WlState value, $Res Function(_WlState) _then) = __$WlStateCopyWithImpl;
@override @useResult
$Res call({
 LoginWhiteLabelingParams loginWhiteLabelingParams, WhiteLabelingParams userParams, ThemeData theme, ThemeData loginTheme, bool isUserWlMode, Widget logo
});




}
/// @nodoc
class __$WlStateCopyWithImpl<$Res>
    implements _$WlStateCopyWith<$Res> {
  __$WlStateCopyWithImpl(this._self, this._then);

  final _WlState _self;
  final $Res Function(_WlState) _then;

/// Create a copy of WlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginWhiteLabelingParams = null,Object? userParams = null,Object? theme = null,Object? loginTheme = null,Object? isUserWlMode = null,Object? logo = null,}) {
  return _then(_WlState(
loginWhiteLabelingParams: null == loginWhiteLabelingParams ? _self.loginWhiteLabelingParams : loginWhiteLabelingParams // ignore: cast_nullable_to_non_nullable
as LoginWhiteLabelingParams,userParams: null == userParams ? _self.userParams : userParams // ignore: cast_nullable_to_non_nullable
as WhiteLabelingParams,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemeData,loginTheme: null == loginTheme ? _self.loginTheme : loginTheme // ignore: cast_nullable_to_non_nullable
as ThemeData,isUserWlMode: null == isUserWlMode ? _self.isUserWlMode : isUserWlMode // ignore: cast_nullable_to_non_nullable
as bool,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}


}

// dart format on
