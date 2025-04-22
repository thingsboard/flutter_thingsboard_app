// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String username, String password) login,
    required TResult Function(Oauth2Entity oauth2) loginWithOauth2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String username, String password)? login,
    TResult? Function(Oauth2Entity oauth2)? loginWithOauth2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String username, String password)? login,
    TResult Function(Oauth2Entity oauth2)? loginWithOauth2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginFetchEvent value) fetch,
    required TResult Function(Login value) login,
    required TResult Function(LoginWithOauth2Event value) loginWithOauth2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFetchEvent value)? fetch,
    TResult? Function(Login value)? login,
    TResult? Function(LoginWithOauth2Event value)? loginWithOauth2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFetchEvent value)? fetch,
    TResult Function(Login value)? login,
    TResult Function(LoginWithOauth2Event value)? loginWithOauth2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginFetchEventImplCopyWith<$Res> {
  factory _$$LoginFetchEventImplCopyWith(_$LoginFetchEventImpl value,
          $Res Function(_$LoginFetchEventImpl) then) =
      __$$LoginFetchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginFetchEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginFetchEventImpl>
    implements _$$LoginFetchEventImplCopyWith<$Res> {
  __$$LoginFetchEventImplCopyWithImpl(
      _$LoginFetchEventImpl _value, $Res Function(_$LoginFetchEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginFetchEventImpl implements LoginFetchEvent {
  const _$LoginFetchEventImpl();

  @override
  String toString() {
    return 'LoginEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginFetchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String username, String password) login,
    required TResult Function(Oauth2Entity oauth2) loginWithOauth2,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String username, String password)? login,
    TResult? Function(Oauth2Entity oauth2)? loginWithOauth2,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String username, String password)? login,
    TResult Function(Oauth2Entity oauth2)? loginWithOauth2,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginFetchEvent value) fetch,
    required TResult Function(Login value) login,
    required TResult Function(LoginWithOauth2Event value) loginWithOauth2,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFetchEvent value)? fetch,
    TResult? Function(Login value)? login,
    TResult? Function(LoginWithOauth2Event value)? loginWithOauth2,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFetchEvent value)? fetch,
    TResult Function(Login value)? login,
    TResult Function(LoginWithOauth2Event value)? loginWithOauth2,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class LoginFetchEvent implements LoginEvent {
  const factory LoginFetchEvent() = _$LoginFetchEventImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements Login {
  const _$LoginImpl({required this.username, required this.password});

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.login(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String username, String password) login,
    required TResult Function(Oauth2Entity oauth2) loginWithOauth2,
  }) {
    return login(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String username, String password)? login,
    TResult? Function(Oauth2Entity oauth2)? loginWithOauth2,
  }) {
    return login?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String username, String password)? login,
    TResult Function(Oauth2Entity oauth2)? loginWithOauth2,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginFetchEvent value) fetch,
    required TResult Function(Login value) login,
    required TResult Function(LoginWithOauth2Event value) loginWithOauth2,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFetchEvent value)? fetch,
    TResult? Function(Login value)? login,
    TResult? Function(LoginWithOauth2Event value)? loginWithOauth2,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFetchEvent value)? fetch,
    TResult Function(Login value)? login,
    TResult Function(LoginWithOauth2Event value)? loginWithOauth2,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements LoginEvent {
  const factory Login(
      {required final String username,
      required final String password}) = _$LoginImpl;

  String get username;
  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithOauth2EventImplCopyWith<$Res> {
  factory _$$LoginWithOauth2EventImplCopyWith(_$LoginWithOauth2EventImpl value,
          $Res Function(_$LoginWithOauth2EventImpl) then) =
      __$$LoginWithOauth2EventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Oauth2Entity oauth2});

  $Oauth2EntityCopyWith<$Res> get oauth2;
}

/// @nodoc
class __$$LoginWithOauth2EventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginWithOauth2EventImpl>
    implements _$$LoginWithOauth2EventImplCopyWith<$Res> {
  __$$LoginWithOauth2EventImplCopyWithImpl(_$LoginWithOauth2EventImpl _value,
      $Res Function(_$LoginWithOauth2EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oauth2 = null,
  }) {
    return _then(_$LoginWithOauth2EventImpl(
      null == oauth2
          ? _value.oauth2
          : oauth2 // ignore: cast_nullable_to_non_nullable
              as Oauth2Entity,
    ));
  }

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Oauth2EntityCopyWith<$Res> get oauth2 {
    return $Oauth2EntityCopyWith<$Res>(_value.oauth2, (value) {
      return _then(_value.copyWith(oauth2: value));
    });
  }
}

/// @nodoc

class _$LoginWithOauth2EventImpl implements LoginWithOauth2Event {
  const _$LoginWithOauth2EventImpl(this.oauth2);

  @override
  final Oauth2Entity oauth2;

  @override
  String toString() {
    return 'LoginEvent.loginWithOauth2(oauth2: $oauth2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithOauth2EventImpl &&
            (identical(other.oauth2, oauth2) || other.oauth2 == oauth2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oauth2);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithOauth2EventImplCopyWith<_$LoginWithOauth2EventImpl>
      get copyWith =>
          __$$LoginWithOauth2EventImplCopyWithImpl<_$LoginWithOauth2EventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String username, String password) login,
    required TResult Function(Oauth2Entity oauth2) loginWithOauth2,
  }) {
    return loginWithOauth2(oauth2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String username, String password)? login,
    TResult? Function(Oauth2Entity oauth2)? loginWithOauth2,
  }) {
    return loginWithOauth2?.call(oauth2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String username, String password)? login,
    TResult Function(Oauth2Entity oauth2)? loginWithOauth2,
    required TResult orElse(),
  }) {
    if (loginWithOauth2 != null) {
      return loginWithOauth2(oauth2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginFetchEvent value) fetch,
    required TResult Function(Login value) login,
    required TResult Function(LoginWithOauth2Event value) loginWithOauth2,
  }) {
    return loginWithOauth2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFetchEvent value)? fetch,
    TResult? Function(Login value)? login,
    TResult? Function(LoginWithOauth2Event value)? loginWithOauth2,
  }) {
    return loginWithOauth2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFetchEvent value)? fetch,
    TResult Function(Login value)? login,
    TResult Function(LoginWithOauth2Event value)? loginWithOauth2,
    required TResult orElse(),
  }) {
    if (loginWithOauth2 != null) {
      return loginWithOauth2(this);
    }
    return orElse();
  }
}

abstract class LoginWithOauth2Event implements LoginEvent {
  const factory LoginWithOauth2Event(final Oauth2Entity oauth2) =
      _$LoginWithOauth2EventImpl;

  Oauth2Entity get oauth2;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithOauth2EventImplCopyWith<_$LoginWithOauth2EventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Oauth2Entity> oAuthClients) data,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function() loginWip,
    required TResult Function() mfa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Oauth2Entity> oAuthClients)? data,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function()? loginWip,
    TResult? Function()? mfa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Oauth2Entity> oAuthClients)? data,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function()? loginWip,
    TResult Function()? mfa,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginDataState value) data,
    required TResult Function(LoginStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(LoginStateLoginInProgress value) loginWip,
    required TResult Function(LoginStateMfa value) mfa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginDataState value)? data,
    TResult? Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(LoginStateLoginInProgress value)? loginWip,
    TResult? Function(LoginStateMfa value)? mfa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginDataState value)? data,
    TResult Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(LoginStateLoginInProgress value)? loginWip,
    TResult Function(LoginStateMfa value)? mfa,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginLoadingStateImplCopyWith<$Res> {
  factory _$$LoginLoadingStateImplCopyWith(_$LoginLoadingStateImpl value,
          $Res Function(_$LoginLoadingStateImpl) then) =
      __$$LoginLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadingStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginLoadingStateImpl>
    implements _$$LoginLoadingStateImplCopyWith<$Res> {
  __$$LoginLoadingStateImplCopyWithImpl(_$LoginLoadingStateImpl _value,
      $Res Function(_$LoginLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginLoadingStateImpl implements LoginLoadingState {
  const _$LoginLoadingStateImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Oauth2Entity> oAuthClients) data,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function() loginWip,
    required TResult Function() mfa,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Oauth2Entity> oAuthClients)? data,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function()? loginWip,
    TResult? Function()? mfa,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Oauth2Entity> oAuthClients)? data,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function()? loginWip,
    TResult Function()? mfa,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginDataState value) data,
    required TResult Function(LoginStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(LoginStateLoginInProgress value) loginWip,
    required TResult Function(LoginStateMfa value) mfa,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginDataState value)? data,
    TResult? Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(LoginStateLoginInProgress value)? loginWip,
    TResult? Function(LoginStateMfa value)? mfa,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginDataState value)? data,
    TResult Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(LoginStateLoginInProgress value)? loginWip,
    TResult Function(LoginStateMfa value)? mfa,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoadingState implements LoginState {
  const factory LoginLoadingState() = _$LoginLoadingStateImpl;
}

/// @nodoc
abstract class _$$LoginDataStateImplCopyWith<$Res> {
  factory _$$LoginDataStateImplCopyWith(_$LoginDataStateImpl value,
          $Res Function(_$LoginDataStateImpl) then) =
      __$$LoginDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Oauth2Entity> oAuthClients});
}

/// @nodoc
class __$$LoginDataStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginDataStateImpl>
    implements _$$LoginDataStateImplCopyWith<$Res> {
  __$$LoginDataStateImplCopyWithImpl(
      _$LoginDataStateImpl _value, $Res Function(_$LoginDataStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oAuthClients = null,
  }) {
    return _then(_$LoginDataStateImpl(
      oAuthClients: null == oAuthClients
          ? _value._oAuthClients
          : oAuthClients // ignore: cast_nullable_to_non_nullable
              as List<Oauth2Entity>,
    ));
  }
}

/// @nodoc

class _$LoginDataStateImpl implements LoginDataState {
  const _$LoginDataStateImpl({required final List<Oauth2Entity> oAuthClients})
      : _oAuthClients = oAuthClients;

  final List<Oauth2Entity> _oAuthClients;
  @override
  List<Oauth2Entity> get oAuthClients {
    if (_oAuthClients is EqualUnmodifiableListView) return _oAuthClients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oAuthClients);
  }

  @override
  String toString() {
    return 'LoginState.data(oAuthClients: $oAuthClients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataStateImpl &&
            const DeepCollectionEquality()
                .equals(other._oAuthClients, _oAuthClients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_oAuthClients));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataStateImplCopyWith<_$LoginDataStateImpl> get copyWith =>
      __$$LoginDataStateImplCopyWithImpl<_$LoginDataStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Oauth2Entity> oAuthClients) data,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function() loginWip,
    required TResult Function() mfa,
  }) {
    return data(oAuthClients);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Oauth2Entity> oAuthClients)? data,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function()? loginWip,
    TResult? Function()? mfa,
  }) {
    return data?.call(oAuthClients);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Oauth2Entity> oAuthClients)? data,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function()? loginWip,
    TResult Function()? mfa,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(oAuthClients);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginDataState value) data,
    required TResult Function(LoginStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(LoginStateLoginInProgress value) loginWip,
    required TResult Function(LoginStateMfa value) mfa,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginDataState value)? data,
    TResult? Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(LoginStateLoginInProgress value)? loginWip,
    TResult? Function(LoginStateMfa value)? mfa,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginDataState value)? data,
    TResult Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(LoginStateLoginInProgress value)? loginWip,
    TResult Function(LoginStateMfa value)? mfa,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class LoginDataState implements LoginState {
  const factory LoginDataState(
      {required final List<Oauth2Entity> oAuthClients}) = _$LoginDataStateImpl;

  List<Oauth2Entity> get oAuthClients;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginDataStateImplCopyWith<_$LoginDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStateRequireClientUpdateImplCopyWith<$Res> {
  factory _$$LoginStateRequireClientUpdateImplCopyWith(
          _$LoginStateRequireClientUpdateImpl value,
          $Res Function(_$LoginStateRequireClientUpdateImpl) then) =
      __$$LoginStateRequireClientUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VersionInfo versionInfo, StoreInfo? storeInfo});
}

/// @nodoc
class __$$LoginStateRequireClientUpdateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateRequireClientUpdateImpl>
    implements _$$LoginStateRequireClientUpdateImplCopyWith<$Res> {
  __$$LoginStateRequireClientUpdateImplCopyWithImpl(
      _$LoginStateRequireClientUpdateImpl _value,
      $Res Function(_$LoginStateRequireClientUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionInfo = null,
    Object? storeInfo = freezed,
  }) {
    return _then(_$LoginStateRequireClientUpdateImpl(
      versionInfo: null == versionInfo
          ? _value.versionInfo
          : versionInfo // ignore: cast_nullable_to_non_nullable
              as VersionInfo,
      storeInfo: freezed == storeInfo
          ? _value.storeInfo
          : storeInfo // ignore: cast_nullable_to_non_nullable
              as StoreInfo?,
    ));
  }
}

/// @nodoc

class _$LoginStateRequireClientUpdateImpl
    implements LoginStateRequireClientUpdate {
  const _$LoginStateRequireClientUpdateImpl(
      {required this.versionInfo, required this.storeInfo});

  @override
  final VersionInfo versionInfo;
  @override
  final StoreInfo? storeInfo;

  @override
  String toString() {
    return 'LoginState.requireClientUpdate(versionInfo: $versionInfo, storeInfo: $storeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateRequireClientUpdateImpl &&
            (identical(other.versionInfo, versionInfo) ||
                other.versionInfo == versionInfo) &&
            (identical(other.storeInfo, storeInfo) ||
                other.storeInfo == storeInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, versionInfo, storeInfo);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateRequireClientUpdateImplCopyWith<
          _$LoginStateRequireClientUpdateImpl>
      get copyWith => __$$LoginStateRequireClientUpdateImplCopyWithImpl<
          _$LoginStateRequireClientUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Oauth2Entity> oAuthClients) data,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function() loginWip,
    required TResult Function() mfa,
  }) {
    return requireClientUpdate(versionInfo, storeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Oauth2Entity> oAuthClients)? data,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function()? loginWip,
    TResult? Function()? mfa,
  }) {
    return requireClientUpdate?.call(versionInfo, storeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Oauth2Entity> oAuthClients)? data,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function()? loginWip,
    TResult Function()? mfa,
    required TResult orElse(),
  }) {
    if (requireClientUpdate != null) {
      return requireClientUpdate(versionInfo, storeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginDataState value) data,
    required TResult Function(LoginStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(LoginStateLoginInProgress value) loginWip,
    required TResult Function(LoginStateMfa value) mfa,
  }) {
    return requireClientUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginDataState value)? data,
    TResult? Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(LoginStateLoginInProgress value)? loginWip,
    TResult? Function(LoginStateMfa value)? mfa,
  }) {
    return requireClientUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginDataState value)? data,
    TResult Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(LoginStateLoginInProgress value)? loginWip,
    TResult Function(LoginStateMfa value)? mfa,
    required TResult orElse(),
  }) {
    if (requireClientUpdate != null) {
      return requireClientUpdate(this);
    }
    return orElse();
  }
}

abstract class LoginStateRequireClientUpdate implements LoginState {
  const factory LoginStateRequireClientUpdate(
          {required final VersionInfo versionInfo,
          required final StoreInfo? storeInfo}) =
      _$LoginStateRequireClientUpdateImpl;

  VersionInfo get versionInfo;
  StoreInfo? get storeInfo;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateRequireClientUpdateImplCopyWith<
          _$LoginStateRequireClientUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStateLoginInProgressImplCopyWith<$Res> {
  factory _$$LoginStateLoginInProgressImplCopyWith(
          _$LoginStateLoginInProgressImpl value,
          $Res Function(_$LoginStateLoginInProgressImpl) then) =
      __$$LoginStateLoginInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateLoginInProgressImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateLoginInProgressImpl>
    implements _$$LoginStateLoginInProgressImplCopyWith<$Res> {
  __$$LoginStateLoginInProgressImplCopyWithImpl(
      _$LoginStateLoginInProgressImpl _value,
      $Res Function(_$LoginStateLoginInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginStateLoginInProgressImpl implements LoginStateLoginInProgress {
  const _$LoginStateLoginInProgressImpl();

  @override
  String toString() {
    return 'LoginState.loginWip()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateLoginInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Oauth2Entity> oAuthClients) data,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function() loginWip,
    required TResult Function() mfa,
  }) {
    return loginWip();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Oauth2Entity> oAuthClients)? data,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function()? loginWip,
    TResult? Function()? mfa,
  }) {
    return loginWip?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Oauth2Entity> oAuthClients)? data,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function()? loginWip,
    TResult Function()? mfa,
    required TResult orElse(),
  }) {
    if (loginWip != null) {
      return loginWip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginDataState value) data,
    required TResult Function(LoginStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(LoginStateLoginInProgress value) loginWip,
    required TResult Function(LoginStateMfa value) mfa,
  }) {
    return loginWip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginDataState value)? data,
    TResult? Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(LoginStateLoginInProgress value)? loginWip,
    TResult? Function(LoginStateMfa value)? mfa,
  }) {
    return loginWip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginDataState value)? data,
    TResult Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(LoginStateLoginInProgress value)? loginWip,
    TResult Function(LoginStateMfa value)? mfa,
    required TResult orElse(),
  }) {
    if (loginWip != null) {
      return loginWip(this);
    }
    return orElse();
  }
}

abstract class LoginStateLoginInProgress implements LoginState {
  const factory LoginStateLoginInProgress() = _$LoginStateLoginInProgressImpl;
}

/// @nodoc
abstract class _$$LoginStateMfaImplCopyWith<$Res> {
  factory _$$LoginStateMfaImplCopyWith(
          _$LoginStateMfaImpl value, $Res Function(_$LoginStateMfaImpl) then) =
      __$$LoginStateMfaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateMfaImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateMfaImpl>
    implements _$$LoginStateMfaImplCopyWith<$Res> {
  __$$LoginStateMfaImplCopyWithImpl(
      _$LoginStateMfaImpl _value, $Res Function(_$LoginStateMfaImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginStateMfaImpl implements LoginStateMfa {
  const _$LoginStateMfaImpl();

  @override
  String toString() {
    return 'LoginState.mfa()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateMfaImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Oauth2Entity> oAuthClients) data,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function() loginWip,
    required TResult Function() mfa,
  }) {
    return mfa();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Oauth2Entity> oAuthClients)? data,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function()? loginWip,
    TResult? Function()? mfa,
  }) {
    return mfa?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Oauth2Entity> oAuthClients)? data,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function()? loginWip,
    TResult Function()? mfa,
    required TResult orElse(),
  }) {
    if (mfa != null) {
      return mfa();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginDataState value) data,
    required TResult Function(LoginStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(LoginStateLoginInProgress value) loginWip,
    required TResult Function(LoginStateMfa value) mfa,
  }) {
    return mfa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginDataState value)? data,
    TResult? Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(LoginStateLoginInProgress value)? loginWip,
    TResult? Function(LoginStateMfa value)? mfa,
  }) {
    return mfa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginDataState value)? data,
    TResult Function(LoginStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(LoginStateLoginInProgress value)? loginWip,
    TResult Function(LoginStateMfa value)? mfa,
    required TResult orElse(),
  }) {
    if (mfa != null) {
      return mfa(this);
    }
    return orElse();
  }
}

abstract class LoginStateMfa implements LoginState {
  const factory LoginStateMfa() = _$LoginStateMfaImpl;
}
