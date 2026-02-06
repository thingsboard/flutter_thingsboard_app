// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardArgumentsEntity {

 String get id; String? get title; String? get state; bool? get hideToolbar; bool get animate;
/// Create a copy of DashboardArgumentsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardArgumentsEntityCopyWith<DashboardArgumentsEntity> get copyWith => _$DashboardArgumentsEntityCopyWithImpl<DashboardArgumentsEntity>(this as DashboardArgumentsEntity, _$identity);

  /// Serializes this DashboardArgumentsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardArgumentsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.state, state) || other.state == state)&&(identical(other.hideToolbar, hideToolbar) || other.hideToolbar == hideToolbar)&&(identical(other.animate, animate) || other.animate == animate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,state,hideToolbar,animate);

@override
String toString() {
  return 'DashboardArgumentsEntity(id: $id, title: $title, state: $state, hideToolbar: $hideToolbar, animate: $animate)';
}


}

/// @nodoc
abstract mixin class $DashboardArgumentsEntityCopyWith<$Res>  {
  factory $DashboardArgumentsEntityCopyWith(DashboardArgumentsEntity value, $Res Function(DashboardArgumentsEntity) _then) = _$DashboardArgumentsEntityCopyWithImpl;
@useResult
$Res call({
 String id, String? title, String? state, bool? hideToolbar, bool animate
});




}
/// @nodoc
class _$DashboardArgumentsEntityCopyWithImpl<$Res>
    implements $DashboardArgumentsEntityCopyWith<$Res> {
  _$DashboardArgumentsEntityCopyWithImpl(this._self, this._then);

  final DashboardArgumentsEntity _self;
  final $Res Function(DashboardArgumentsEntity) _then;

/// Create a copy of DashboardArgumentsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = freezed,Object? state = freezed,Object? hideToolbar = freezed,Object? animate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,hideToolbar: freezed == hideToolbar ? _self.hideToolbar : hideToolbar // ignore: cast_nullable_to_non_nullable
as bool?,animate: null == animate ? _self.animate : animate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardArgumentsEntity].
extension DashboardArgumentsEntityPatterns on DashboardArgumentsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardArgumentsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardArgumentsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardArgumentsEntity value)  $default,){
final _that = this;
switch (_that) {
case _DashboardArgumentsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardArgumentsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardArgumentsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? title,  String? state,  bool? hideToolbar,  bool animate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardArgumentsEntity() when $default != null:
return $default(_that.id,_that.title,_that.state,_that.hideToolbar,_that.animate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? title,  String? state,  bool? hideToolbar,  bool animate)  $default,) {final _that = this;
switch (_that) {
case _DashboardArgumentsEntity():
return $default(_that.id,_that.title,_that.state,_that.hideToolbar,_that.animate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? title,  String? state,  bool? hideToolbar,  bool animate)?  $default,) {final _that = this;
switch (_that) {
case _DashboardArgumentsEntity() when $default != null:
return $default(_that.id,_that.title,_that.state,_that.hideToolbar,_that.animate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardArgumentsEntity implements DashboardArgumentsEntity {
  const _DashboardArgumentsEntity({required this.id, this.title, this.state, this.hideToolbar, this.animate = true});
  factory _DashboardArgumentsEntity.fromJson(Map<String, dynamic> json) => _$DashboardArgumentsEntityFromJson(json);

@override final  String id;
@override final  String? title;
@override final  String? state;
@override final  bool? hideToolbar;
@override@JsonKey() final  bool animate;

/// Create a copy of DashboardArgumentsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardArgumentsEntityCopyWith<_DashboardArgumentsEntity> get copyWith => __$DashboardArgumentsEntityCopyWithImpl<_DashboardArgumentsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardArgumentsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardArgumentsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.state, state) || other.state == state)&&(identical(other.hideToolbar, hideToolbar) || other.hideToolbar == hideToolbar)&&(identical(other.animate, animate) || other.animate == animate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,state,hideToolbar,animate);

@override
String toString() {
  return 'DashboardArgumentsEntity(id: $id, title: $title, state: $state, hideToolbar: $hideToolbar, animate: $animate)';
}


}

/// @nodoc
abstract mixin class _$DashboardArgumentsEntityCopyWith<$Res> implements $DashboardArgumentsEntityCopyWith<$Res> {
  factory _$DashboardArgumentsEntityCopyWith(_DashboardArgumentsEntity value, $Res Function(_DashboardArgumentsEntity) _then) = __$DashboardArgumentsEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? title, String? state, bool? hideToolbar, bool animate
});




}
/// @nodoc
class __$DashboardArgumentsEntityCopyWithImpl<$Res>
    implements _$DashboardArgumentsEntityCopyWith<$Res> {
  __$DashboardArgumentsEntityCopyWithImpl(this._self, this._then);

  final _DashboardArgumentsEntity _self;
  final $Res Function(_DashboardArgumentsEntity) _then;

/// Create a copy of DashboardArgumentsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? state = freezed,Object? hideToolbar = freezed,Object? animate = null,}) {
  return _then(_DashboardArgumentsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,hideToolbar: freezed == hideToolbar ? _self.hideToolbar : hideToolbar // ignore: cast_nullable_to_non_nullable
as bool?,animate: null == animate ? _self.animate : animate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
