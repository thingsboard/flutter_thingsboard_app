// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_endpoint_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SwitchEndpointArgs _$SwitchEndpointArgsFromJson(Map<String, dynamic> json) {
  return _SwitchEndpointArgs.fromJson(json);
}

/// @nodoc
mixin _$SwitchEndpointArgs {
  String get secret => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get ttl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromFluroData, toJson: uriToJson)
  Uri get uri => throw _privateConstructorUsedError;

  /// Serializes this SwitchEndpointArgs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwitchEndpointArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwitchEndpointArgsCopyWith<SwitchEndpointArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchEndpointArgsCopyWith<$Res> {
  factory $SwitchEndpointArgsCopyWith(
          SwitchEndpointArgs value, $Res Function(SwitchEndpointArgs) then) =
      _$SwitchEndpointArgsCopyWithImpl<$Res, SwitchEndpointArgs>;
  @useResult
  $Res call(
      {String secret,
      String? host,
      String? ttl,
      @JsonKey(fromJson: fromFluroData, toJson: uriToJson) Uri uri});
}

/// @nodoc
class _$SwitchEndpointArgsCopyWithImpl<$Res, $Val extends SwitchEndpointArgs>
    implements $SwitchEndpointArgsCopyWith<$Res> {
  _$SwitchEndpointArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwitchEndpointArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secret = null,
    Object? host = freezed,
    Object? ttl = freezed,
    Object? uri = null,
  }) {
    return _then(_value.copyWith(
      secret: null == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      ttl: freezed == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwitchEndpointArgsImplCopyWith<$Res>
    implements $SwitchEndpointArgsCopyWith<$Res> {
  factory _$$SwitchEndpointArgsImplCopyWith(_$SwitchEndpointArgsImpl value,
          $Res Function(_$SwitchEndpointArgsImpl) then) =
      __$$SwitchEndpointArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String secret,
      String? host,
      String? ttl,
      @JsonKey(fromJson: fromFluroData, toJson: uriToJson) Uri uri});
}

/// @nodoc
class __$$SwitchEndpointArgsImplCopyWithImpl<$Res>
    extends _$SwitchEndpointArgsCopyWithImpl<$Res, _$SwitchEndpointArgsImpl>
    implements _$$SwitchEndpointArgsImplCopyWith<$Res> {
  __$$SwitchEndpointArgsImplCopyWithImpl(_$SwitchEndpointArgsImpl _value,
      $Res Function(_$SwitchEndpointArgsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwitchEndpointArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secret = null,
    Object? host = freezed,
    Object? ttl = freezed,
    Object? uri = null,
  }) {
    return _then(_$SwitchEndpointArgsImpl(
      secret: null == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      ttl: freezed == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwitchEndpointArgsImpl implements _SwitchEndpointArgs {
  _$SwitchEndpointArgsImpl(
      {required this.secret,
      this.host,
      this.ttl,
      @JsonKey(fromJson: fromFluroData, toJson: uriToJson) required this.uri});

  factory _$SwitchEndpointArgsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwitchEndpointArgsImplFromJson(json);

  @override
  final String secret;
  @override
  final String? host;
  @override
  final String? ttl;
  @override
  @JsonKey(fromJson: fromFluroData, toJson: uriToJson)
  final Uri uri;

  @override
  String toString() {
    return 'SwitchEndpointArgs(secret: $secret, host: $host, ttl: $ttl, uri: $uri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchEndpointArgsImpl &&
            (identical(other.secret, secret) || other.secret == secret) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.ttl, ttl) || other.ttl == ttl) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, secret, host, ttl, uri);

  /// Create a copy of SwitchEndpointArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchEndpointArgsImplCopyWith<_$SwitchEndpointArgsImpl> get copyWith =>
      __$$SwitchEndpointArgsImplCopyWithImpl<_$SwitchEndpointArgsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwitchEndpointArgsImplToJson(
      this,
    );
  }
}

abstract class _SwitchEndpointArgs implements SwitchEndpointArgs {
  factory _SwitchEndpointArgs(
      {required final String secret,
      final String? host,
      final String? ttl,
      @JsonKey(fromJson: fromFluroData, toJson: uriToJson)
      required final Uri uri}) = _$SwitchEndpointArgsImpl;

  factory _SwitchEndpointArgs.fromJson(Map<String, dynamic> json) =
      _$SwitchEndpointArgsImpl.fromJson;

  @override
  String get secret;
  @override
  String? get host;
  @override
  String? get ttl;
  @override
  @JsonKey(fromJson: fromFluroData, toJson: uriToJson)
  Uri get uri;

  /// Create a copy of SwitchEndpointArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchEndpointArgsImplCopyWith<_$SwitchEndpointArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
