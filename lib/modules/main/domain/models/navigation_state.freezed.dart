// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavigationState {

 List<NavigationItemData> get bottomBarPages; List<NavigationItemData> get morePages;
/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationStateCopyWith<NavigationState> get copyWith => _$NavigationStateCopyWithImpl<NavigationState>(this as NavigationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationState&&const DeepCollectionEquality().equals(other.bottomBarPages, bottomBarPages)&&const DeepCollectionEquality().equals(other.morePages, morePages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bottomBarPages),const DeepCollectionEquality().hash(morePages));

@override
String toString() {
  return 'NavigationState(bottomBarPages: $bottomBarPages, morePages: $morePages)';
}


}

/// @nodoc
abstract mixin class $NavigationStateCopyWith<$Res>  {
  factory $NavigationStateCopyWith(NavigationState value, $Res Function(NavigationState) _then) = _$NavigationStateCopyWithImpl;
@useResult
$Res call({
 List<NavigationItemData> bottomBarPages, List<NavigationItemData> morePages
});




}
/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._self, this._then);

  final NavigationState _self;
  final $Res Function(NavigationState) _then;

/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bottomBarPages = null,Object? morePages = null,}) {
  return _then(_self.copyWith(
bottomBarPages: null == bottomBarPages ? _self.bottomBarPages : bottomBarPages // ignore: cast_nullable_to_non_nullable
as List<NavigationItemData>,morePages: null == morePages ? _self.morePages : morePages // ignore: cast_nullable_to_non_nullable
as List<NavigationItemData>,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationState].
extension NavigationStatePatterns on NavigationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationState value)  $default,){
final _that = this;
switch (_that) {
case _NavigationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationState value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NavigationItemData> bottomBarPages,  List<NavigationItemData> morePages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
return $default(_that.bottomBarPages,_that.morePages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NavigationItemData> bottomBarPages,  List<NavigationItemData> morePages)  $default,) {final _that = this;
switch (_that) {
case _NavigationState():
return $default(_that.bottomBarPages,_that.morePages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NavigationItemData> bottomBarPages,  List<NavigationItemData> morePages)?  $default,) {final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
return $default(_that.bottomBarPages,_that.morePages);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationState implements NavigationState {
  const _NavigationState({required final  List<NavigationItemData> bottomBarPages, required final  List<NavigationItemData> morePages}): _bottomBarPages = bottomBarPages,_morePages = morePages;
  

 final  List<NavigationItemData> _bottomBarPages;
@override List<NavigationItemData> get bottomBarPages {
  if (_bottomBarPages is EqualUnmodifiableListView) return _bottomBarPages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bottomBarPages);
}

 final  List<NavigationItemData> _morePages;
@override List<NavigationItemData> get morePages {
  if (_morePages is EqualUnmodifiableListView) return _morePages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_morePages);
}


/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationStateCopyWith<_NavigationState> get copyWith => __$NavigationStateCopyWithImpl<_NavigationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationState&&const DeepCollectionEquality().equals(other._bottomBarPages, _bottomBarPages)&&const DeepCollectionEquality().equals(other._morePages, _morePages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bottomBarPages),const DeepCollectionEquality().hash(_morePages));

@override
String toString() {
  return 'NavigationState(bottomBarPages: $bottomBarPages, morePages: $morePages)';
}


}

/// @nodoc
abstract mixin class _$NavigationStateCopyWith<$Res> implements $NavigationStateCopyWith<$Res> {
  factory _$NavigationStateCopyWith(_NavigationState value, $Res Function(_NavigationState) _then) = __$NavigationStateCopyWithImpl;
@override @useResult
$Res call({
 List<NavigationItemData> bottomBarPages, List<NavigationItemData> morePages
});




}
/// @nodoc
class __$NavigationStateCopyWithImpl<$Res>
    implements _$NavigationStateCopyWith<$Res> {
  __$NavigationStateCopyWithImpl(this._self, this._then);

  final _NavigationState _self;
  final $Res Function(_NavigationState) _then;

/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bottomBarPages = null,Object? morePages = null,}) {
  return _then(_NavigationState(
bottomBarPages: null == bottomBarPages ? _self._bottomBarPages : bottomBarPages // ignore: cast_nullable_to_non_nullable
as List<NavigationItemData>,morePages: null == morePages ? _self._morePages : morePages // ignore: cast_nullable_to_non_nullable
as List<NavigationItemData>,
  ));
}


}

// dart format on
