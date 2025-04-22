// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Oauth2Entity {
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Create a copy of Oauth2Entity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Oauth2EntityCopyWith<Oauth2Entity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Oauth2EntityCopyWith<$Res> {
  factory $Oauth2EntityCopyWith(
          Oauth2Entity value, $Res Function(Oauth2Entity) then) =
      _$Oauth2EntityCopyWithImpl<$Res, Oauth2Entity>;
  @useResult
  $Res call({String name, String? icon, String url});
}

/// @nodoc
class _$Oauth2EntityCopyWithImpl<$Res, $Val extends Oauth2Entity>
    implements $Oauth2EntityCopyWith<$Res> {
  _$Oauth2EntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Oauth2Entity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Oauth2EntityImplCopyWith<$Res>
    implements $Oauth2EntityCopyWith<$Res> {
  factory _$$Oauth2EntityImplCopyWith(
          _$Oauth2EntityImpl value, $Res Function(_$Oauth2EntityImpl) then) =
      __$$Oauth2EntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? icon, String url});
}

/// @nodoc
class __$$Oauth2EntityImplCopyWithImpl<$Res>
    extends _$Oauth2EntityCopyWithImpl<$Res, _$Oauth2EntityImpl>
    implements _$$Oauth2EntityImplCopyWith<$Res> {
  __$$Oauth2EntityImplCopyWithImpl(
      _$Oauth2EntityImpl _value, $Res Function(_$Oauth2EntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Oauth2Entity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = freezed,
    Object? url = null,
  }) {
    return _then(_$Oauth2EntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Oauth2EntityImpl implements _Oauth2Entity {
  const _$Oauth2EntityImpl(
      {required this.name, required this.icon, required this.url});

  @override
  final String name;
  @override
  final String? icon;
  @override
  final String url;

  @override
  String toString() {
    return 'Oauth2Entity(name: $name, icon: $icon, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Oauth2EntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, icon, url);

  /// Create a copy of Oauth2Entity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Oauth2EntityImplCopyWith<_$Oauth2EntityImpl> get copyWith =>
      __$$Oauth2EntityImplCopyWithImpl<_$Oauth2EntityImpl>(this, _$identity);
}

abstract class _Oauth2Entity implements Oauth2Entity {
  const factory _Oauth2Entity(
      {required final String name,
      required final String? icon,
      required final String url}) = _$Oauth2EntityImpl;

  @override
  String get name;
  @override
  String? get icon;
  @override
  String get url;

  /// Create a copy of Oauth2Entity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Oauth2EntityImplCopyWith<_$Oauth2EntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
