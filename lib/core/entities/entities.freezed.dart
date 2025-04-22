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
mixin _$TbPlatform {
  bool get isIos => throw _privateConstructorUsedError;
  bool get isAndroid => throw _privateConstructorUsedError;

  /// Create a copy of TbPlatform
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TbPlatformCopyWith<TbPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TbPlatformCopyWith<$Res> {
  factory $TbPlatformCopyWith(
          TbPlatform value, $Res Function(TbPlatform) then) =
      _$TbPlatformCopyWithImpl<$Res, TbPlatform>;
  @useResult
  $Res call({bool isIos, bool isAndroid});
}

/// @nodoc
class _$TbPlatformCopyWithImpl<$Res, $Val extends TbPlatform>
    implements $TbPlatformCopyWith<$Res> {
  _$TbPlatformCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TbPlatform
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isIos = null,
    Object? isAndroid = null,
  }) {
    return _then(_value.copyWith(
      isIos: null == isIos
          ? _value.isIos
          : isIos // ignore: cast_nullable_to_non_nullable
              as bool,
      isAndroid: null == isAndroid
          ? _value.isAndroid
          : isAndroid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TbPlatformImplCopyWith<$Res>
    implements $TbPlatformCopyWith<$Res> {
  factory _$$TbPlatformImplCopyWith(
          _$TbPlatformImpl value, $Res Function(_$TbPlatformImpl) then) =
      __$$TbPlatformImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isIos, bool isAndroid});
}

/// @nodoc
class __$$TbPlatformImplCopyWithImpl<$Res>
    extends _$TbPlatformCopyWithImpl<$Res, _$TbPlatformImpl>
    implements _$$TbPlatformImplCopyWith<$Res> {
  __$$TbPlatformImplCopyWithImpl(
      _$TbPlatformImpl _value, $Res Function(_$TbPlatformImpl) _then)
      : super(_value, _then);

  /// Create a copy of TbPlatform
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isIos = null,
    Object? isAndroid = null,
  }) {
    return _then(_$TbPlatformImpl(
      isIos: null == isIos
          ? _value.isIos
          : isIos // ignore: cast_nullable_to_non_nullable
              as bool,
      isAndroid: null == isAndroid
          ? _value.isAndroid
          : isAndroid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TbPlatformImpl implements _TbPlatform {
  const _$TbPlatformImpl({required this.isIos, required this.isAndroid});

  @override
  final bool isIos;
  @override
  final bool isAndroid;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TbPlatformImpl &&
            (identical(other.isIos, isIos) || other.isIos == isIos) &&
            (identical(other.isAndroid, isAndroid) ||
                other.isAndroid == isAndroid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isIos, isAndroid);

  /// Create a copy of TbPlatform
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TbPlatformImplCopyWith<_$TbPlatformImpl> get copyWith =>
      __$$TbPlatformImplCopyWithImpl<_$TbPlatformImpl>(this, _$identity);
}

abstract class _TbPlatform implements TbPlatform {
  const factory _TbPlatform(
      {required final bool isIos,
      required final bool isAndroid}) = _$TbPlatformImpl;

  @override
  bool get isIos;
  @override
  bool get isAndroid;

  /// Create a copy of TbPlatform
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TbPlatformImplCopyWith<_$TbPlatformImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
