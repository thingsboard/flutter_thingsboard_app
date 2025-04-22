// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Size screenSize, Orientation orientation) init,
    required TResult Function(Size screenSize, Orientation orientation)
        initWithRegions,
    required TResult Function() userLoaded,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Size screenSize, Orientation orientation)? init,
    TResult? Function(Size screenSize, Orientation orientation)?
        initWithRegions,
    TResult? Function()? userLoaded,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Size screenSize, Orientation orientation)? init,
    TResult Function(Size screenSize, Orientation orientation)? initWithRegions,
    TResult Function()? userLoaded,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreEventInit value) init,
    required TResult Function(CoreEventInitWithRegions value) initWithRegions,
    required TResult Function(CoreEventUserLoaded value) userLoaded,
    required TResult Function(CoreEventLogout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreEventInit value)? init,
    TResult? Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult? Function(CoreEventUserLoaded value)? userLoaded,
    TResult? Function(CoreEventLogout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreEventInit value)? init,
    TResult Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult Function(CoreEventUserLoaded value)? userLoaded,
    TResult Function(CoreEventLogout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreEventCopyWith<$Res> {
  factory $CoreEventCopyWith(CoreEvent value, $Res Function(CoreEvent) then) =
      _$CoreEventCopyWithImpl<$Res, CoreEvent>;
}

/// @nodoc
class _$CoreEventCopyWithImpl<$Res, $Val extends CoreEvent>
    implements $CoreEventCopyWith<$Res> {
  _$CoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CoreEventInitImplCopyWith<$Res> {
  factory _$$CoreEventInitImplCopyWith(
          _$CoreEventInitImpl value, $Res Function(_$CoreEventInitImpl) then) =
      __$$CoreEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Size screenSize, Orientation orientation});
}

/// @nodoc
class __$$CoreEventInitImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventInitImpl>
    implements _$$CoreEventInitImplCopyWith<$Res> {
  __$$CoreEventInitImplCopyWithImpl(
      _$CoreEventInitImpl _value, $Res Function(_$CoreEventInitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenSize = null,
    Object? orientation = null,
  }) {
    return _then(_$CoreEventInitImpl(
      screenSize: null == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as Size,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
    ));
  }
}

/// @nodoc

class _$CoreEventInitImpl implements CoreEventInit {
  const _$CoreEventInitImpl(
      {required this.screenSize, required this.orientation});

  @override
  final Size screenSize;
  @override
  final Orientation orientation;

  @override
  String toString() {
    return 'CoreEvent.init(screenSize: $screenSize, orientation: $orientation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreEventInitImpl &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenSize, orientation);

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreEventInitImplCopyWith<_$CoreEventInitImpl> get copyWith =>
      __$$CoreEventInitImplCopyWithImpl<_$CoreEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Size screenSize, Orientation orientation) init,
    required TResult Function(Size screenSize, Orientation orientation)
        initWithRegions,
    required TResult Function() userLoaded,
    required TResult Function() logout,
  }) {
    return init(screenSize, orientation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Size screenSize, Orientation orientation)? init,
    TResult? Function(Size screenSize, Orientation orientation)?
        initWithRegions,
    TResult? Function()? userLoaded,
    TResult? Function()? logout,
  }) {
    return init?.call(screenSize, orientation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Size screenSize, Orientation orientation)? init,
    TResult Function(Size screenSize, Orientation orientation)? initWithRegions,
    TResult Function()? userLoaded,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(screenSize, orientation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreEventInit value) init,
    required TResult Function(CoreEventInitWithRegions value) initWithRegions,
    required TResult Function(CoreEventUserLoaded value) userLoaded,
    required TResult Function(CoreEventLogout value) logout,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreEventInit value)? init,
    TResult? Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult? Function(CoreEventUserLoaded value)? userLoaded,
    TResult? Function(CoreEventLogout value)? logout,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreEventInit value)? init,
    TResult Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult Function(CoreEventUserLoaded value)? userLoaded,
    TResult Function(CoreEventLogout value)? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class CoreEventInit implements CoreEvent {
  const factory CoreEventInit(
      {required final Size screenSize,
      required final Orientation orientation}) = _$CoreEventInitImpl;

  Size get screenSize;
  Orientation get orientation;

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoreEventInitImplCopyWith<_$CoreEventInitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoreEventInitWithRegionsImplCopyWith<$Res> {
  factory _$$CoreEventInitWithRegionsImplCopyWith(
          _$CoreEventInitWithRegionsImpl value,
          $Res Function(_$CoreEventInitWithRegionsImpl) then) =
      __$$CoreEventInitWithRegionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Size screenSize, Orientation orientation});
}

/// @nodoc
class __$$CoreEventInitWithRegionsImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventInitWithRegionsImpl>
    implements _$$CoreEventInitWithRegionsImplCopyWith<$Res> {
  __$$CoreEventInitWithRegionsImplCopyWithImpl(
      _$CoreEventInitWithRegionsImpl _value,
      $Res Function(_$CoreEventInitWithRegionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenSize = null,
    Object? orientation = null,
  }) {
    return _then(_$CoreEventInitWithRegionsImpl(
      screenSize: null == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as Size,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
    ));
  }
}

/// @nodoc

class _$CoreEventInitWithRegionsImpl implements CoreEventInitWithRegions {
  const _$CoreEventInitWithRegionsImpl(
      {required this.screenSize, required this.orientation});

  @override
  final Size screenSize;
  @override
  final Orientation orientation;

  @override
  String toString() {
    return 'CoreEvent.initWithRegions(screenSize: $screenSize, orientation: $orientation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreEventInitWithRegionsImpl &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenSize, orientation);

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreEventInitWithRegionsImplCopyWith<_$CoreEventInitWithRegionsImpl>
      get copyWith => __$$CoreEventInitWithRegionsImplCopyWithImpl<
          _$CoreEventInitWithRegionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Size screenSize, Orientation orientation) init,
    required TResult Function(Size screenSize, Orientation orientation)
        initWithRegions,
    required TResult Function() userLoaded,
    required TResult Function() logout,
  }) {
    return initWithRegions(screenSize, orientation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Size screenSize, Orientation orientation)? init,
    TResult? Function(Size screenSize, Orientation orientation)?
        initWithRegions,
    TResult? Function()? userLoaded,
    TResult? Function()? logout,
  }) {
    return initWithRegions?.call(screenSize, orientation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Size screenSize, Orientation orientation)? init,
    TResult Function(Size screenSize, Orientation orientation)? initWithRegions,
    TResult Function()? userLoaded,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (initWithRegions != null) {
      return initWithRegions(screenSize, orientation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreEventInit value) init,
    required TResult Function(CoreEventInitWithRegions value) initWithRegions,
    required TResult Function(CoreEventUserLoaded value) userLoaded,
    required TResult Function(CoreEventLogout value) logout,
  }) {
    return initWithRegions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreEventInit value)? init,
    TResult? Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult? Function(CoreEventUserLoaded value)? userLoaded,
    TResult? Function(CoreEventLogout value)? logout,
  }) {
    return initWithRegions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreEventInit value)? init,
    TResult Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult Function(CoreEventUserLoaded value)? userLoaded,
    TResult Function(CoreEventLogout value)? logout,
    required TResult orElse(),
  }) {
    if (initWithRegions != null) {
      return initWithRegions(this);
    }
    return orElse();
  }
}

abstract class CoreEventInitWithRegions implements CoreEvent {
  const factory CoreEventInitWithRegions(
      {required final Size screenSize,
      required final Orientation orientation}) = _$CoreEventInitWithRegionsImpl;

  Size get screenSize;
  Orientation get orientation;

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoreEventInitWithRegionsImplCopyWith<_$CoreEventInitWithRegionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoreEventUserLoadedImplCopyWith<$Res> {
  factory _$$CoreEventUserLoadedImplCopyWith(_$CoreEventUserLoadedImpl value,
          $Res Function(_$CoreEventUserLoadedImpl) then) =
      __$$CoreEventUserLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoreEventUserLoadedImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventUserLoadedImpl>
    implements _$$CoreEventUserLoadedImplCopyWith<$Res> {
  __$$CoreEventUserLoadedImplCopyWithImpl(_$CoreEventUserLoadedImpl _value,
      $Res Function(_$CoreEventUserLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CoreEventUserLoadedImpl implements CoreEventUserLoaded {
  const _$CoreEventUserLoadedImpl();

  @override
  String toString() {
    return 'CoreEvent.userLoaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreEventUserLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Size screenSize, Orientation orientation) init,
    required TResult Function(Size screenSize, Orientation orientation)
        initWithRegions,
    required TResult Function() userLoaded,
    required TResult Function() logout,
  }) {
    return userLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Size screenSize, Orientation orientation)? init,
    TResult? Function(Size screenSize, Orientation orientation)?
        initWithRegions,
    TResult? Function()? userLoaded,
    TResult? Function()? logout,
  }) {
    return userLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Size screenSize, Orientation orientation)? init,
    TResult Function(Size screenSize, Orientation orientation)? initWithRegions,
    TResult Function()? userLoaded,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreEventInit value) init,
    required TResult Function(CoreEventInitWithRegions value) initWithRegions,
    required TResult Function(CoreEventUserLoaded value) userLoaded,
    required TResult Function(CoreEventLogout value) logout,
  }) {
    return userLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreEventInit value)? init,
    TResult? Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult? Function(CoreEventUserLoaded value)? userLoaded,
    TResult? Function(CoreEventLogout value)? logout,
  }) {
    return userLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreEventInit value)? init,
    TResult Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult Function(CoreEventUserLoaded value)? userLoaded,
    TResult Function(CoreEventLogout value)? logout,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(this);
    }
    return orElse();
  }
}

abstract class CoreEventUserLoaded implements CoreEvent {
  const factory CoreEventUserLoaded() = _$CoreEventUserLoadedImpl;
}

/// @nodoc
abstract class _$$CoreEventLogoutImplCopyWith<$Res> {
  factory _$$CoreEventLogoutImplCopyWith(_$CoreEventLogoutImpl value,
          $Res Function(_$CoreEventLogoutImpl) then) =
      __$$CoreEventLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoreEventLogoutImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventLogoutImpl>
    implements _$$CoreEventLogoutImplCopyWith<$Res> {
  __$$CoreEventLogoutImplCopyWithImpl(
      _$CoreEventLogoutImpl _value, $Res Function(_$CoreEventLogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CoreEventLogoutImpl implements CoreEventLogout {
  const _$CoreEventLogoutImpl();

  @override
  String toString() {
    return 'CoreEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoreEventLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Size screenSize, Orientation orientation) init,
    required TResult Function(Size screenSize, Orientation orientation)
        initWithRegions,
    required TResult Function() userLoaded,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Size screenSize, Orientation orientation)? init,
    TResult? Function(Size screenSize, Orientation orientation)?
        initWithRegions,
    TResult? Function()? userLoaded,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Size screenSize, Orientation orientation)? init,
    TResult Function(Size screenSize, Orientation orientation)? initWithRegions,
    TResult Function()? userLoaded,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreEventInit value) init,
    required TResult Function(CoreEventInitWithRegions value) initWithRegions,
    required TResult Function(CoreEventUserLoaded value) userLoaded,
    required TResult Function(CoreEventLogout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreEventInit value)? init,
    TResult? Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult? Function(CoreEventUserLoaded value)? userLoaded,
    TResult? Function(CoreEventLogout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreEventInit value)? init,
    TResult Function(CoreEventInitWithRegions value)? initWithRegions,
    TResult Function(CoreEventUserLoaded value)? userLoaded,
    TResult Function(CoreEventLogout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class CoreEventLogout implements CoreEvent {
  const factory CoreEventLogout() = _$CoreEventLogoutImpl;
}

/// @nodoc
mixin _$CoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? message) fatalError,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function(bool isFullyAuthenticated,
            String? defaultDashboardId, bool fullscreenDashboard)
        userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? message)? fatalError,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? message)? fatalError,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateLoading value) loading,
    required TResult Function(CoreStatesFatalError value) fatalError,
    required TResult Function(CoreStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(CoreStateUserLoaded value) userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateLoading value)? loading,
    TResult? Function(CoreStatesFatalError value)? fatalError,
    TResult? Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(CoreStateUserLoaded value)? userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateLoading value)? loading,
    TResult Function(CoreStatesFatalError value)? fatalError,
    TResult Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(CoreStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<$Res> {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) then) =
      _$CoreStateCopyWithImpl<$Res, CoreState>;
}

/// @nodoc
class _$CoreStateCopyWithImpl<$Res, $Val extends CoreState>
    implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CoreStateLoadingImplCopyWith<$Res> {
  factory _$$CoreStateLoadingImplCopyWith(_$CoreStateLoadingImpl value,
          $Res Function(_$CoreStateLoadingImpl) then) =
      __$$CoreStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoreStateLoadingImplCopyWithImpl<$Res>
    extends _$CoreStateCopyWithImpl<$Res, _$CoreStateLoadingImpl>
    implements _$$CoreStateLoadingImplCopyWith<$Res> {
  __$$CoreStateLoadingImplCopyWithImpl(_$CoreStateLoadingImpl _value,
      $Res Function(_$CoreStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CoreStateLoadingImpl implements CoreStateLoading {
  const _$CoreStateLoadingImpl();

  @override
  String toString() {
    return 'CoreState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoreStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? message) fatalError,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function(bool isFullyAuthenticated,
            String? defaultDashboardId, bool fullscreenDashboard)
        userLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? message)? fatalError,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? message)? fatalError,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
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
    required TResult Function(CoreStateLoading value) loading,
    required TResult Function(CoreStatesFatalError value) fatalError,
    required TResult Function(CoreStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(CoreStateUserLoaded value) userLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateLoading value)? loading,
    TResult? Function(CoreStatesFatalError value)? fatalError,
    TResult? Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(CoreStateUserLoaded value)? userLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateLoading value)? loading,
    TResult Function(CoreStatesFatalError value)? fatalError,
    TResult Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(CoreStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CoreStateLoading implements CoreState {
  const factory CoreStateLoading() = _$CoreStateLoadingImpl;
}

/// @nodoc
abstract class _$$CoreStatesFatalErrorImplCopyWith<$Res> {
  factory _$$CoreStatesFatalErrorImplCopyWith(_$CoreStatesFatalErrorImpl value,
          $Res Function(_$CoreStatesFatalErrorImpl) then) =
      __$$CoreStatesFatalErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CoreStatesFatalErrorImplCopyWithImpl<$Res>
    extends _$CoreStateCopyWithImpl<$Res, _$CoreStatesFatalErrorImpl>
    implements _$$CoreStatesFatalErrorImplCopyWith<$Res> {
  __$$CoreStatesFatalErrorImplCopyWithImpl(_$CoreStatesFatalErrorImpl _value,
      $Res Function(_$CoreStatesFatalErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CoreStatesFatalErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CoreStatesFatalErrorImpl implements CoreStatesFatalError {
  const _$CoreStatesFatalErrorImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'CoreState.fatalError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreStatesFatalErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreStatesFatalErrorImplCopyWith<_$CoreStatesFatalErrorImpl>
      get copyWith =>
          __$$CoreStatesFatalErrorImplCopyWithImpl<_$CoreStatesFatalErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? message) fatalError,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function(bool isFullyAuthenticated,
            String? defaultDashboardId, bool fullscreenDashboard)
        userLoaded,
  }) {
    return fatalError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? message)? fatalError,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
  }) {
    return fatalError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? message)? fatalError,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
    required TResult orElse(),
  }) {
    if (fatalError != null) {
      return fatalError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateLoading value) loading,
    required TResult Function(CoreStatesFatalError value) fatalError,
    required TResult Function(CoreStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(CoreStateUserLoaded value) userLoaded,
  }) {
    return fatalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateLoading value)? loading,
    TResult? Function(CoreStatesFatalError value)? fatalError,
    TResult? Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(CoreStateUserLoaded value)? userLoaded,
  }) {
    return fatalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateLoading value)? loading,
    TResult Function(CoreStatesFatalError value)? fatalError,
    TResult Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(CoreStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) {
    if (fatalError != null) {
      return fatalError(this);
    }
    return orElse();
  }
}

abstract class CoreStatesFatalError implements CoreState {
  const factory CoreStatesFatalError(final String? message) =
      _$CoreStatesFatalErrorImpl;

  String? get message;

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoreStatesFatalErrorImplCopyWith<_$CoreStatesFatalErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoreStateRequireClientUpdateImplCopyWith<$Res> {
  factory _$$CoreStateRequireClientUpdateImplCopyWith(
          _$CoreStateRequireClientUpdateImpl value,
          $Res Function(_$CoreStateRequireClientUpdateImpl) then) =
      __$$CoreStateRequireClientUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VersionInfo versionInfo, StoreInfo? storeInfo});
}

/// @nodoc
class __$$CoreStateRequireClientUpdateImplCopyWithImpl<$Res>
    extends _$CoreStateCopyWithImpl<$Res, _$CoreStateRequireClientUpdateImpl>
    implements _$$CoreStateRequireClientUpdateImplCopyWith<$Res> {
  __$$CoreStateRequireClientUpdateImplCopyWithImpl(
      _$CoreStateRequireClientUpdateImpl _value,
      $Res Function(_$CoreStateRequireClientUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionInfo = null,
    Object? storeInfo = freezed,
  }) {
    return _then(_$CoreStateRequireClientUpdateImpl(
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

class _$CoreStateRequireClientUpdateImpl
    implements CoreStateRequireClientUpdate {
  const _$CoreStateRequireClientUpdateImpl(
      {required this.versionInfo, required this.storeInfo});

  @override
  final VersionInfo versionInfo;
  @override
  final StoreInfo? storeInfo;

  @override
  String toString() {
    return 'CoreState.requireClientUpdate(versionInfo: $versionInfo, storeInfo: $storeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreStateRequireClientUpdateImpl &&
            (identical(other.versionInfo, versionInfo) ||
                other.versionInfo == versionInfo) &&
            (identical(other.storeInfo, storeInfo) ||
                other.storeInfo == storeInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, versionInfo, storeInfo);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreStateRequireClientUpdateImplCopyWith<
          _$CoreStateRequireClientUpdateImpl>
      get copyWith => __$$CoreStateRequireClientUpdateImplCopyWithImpl<
          _$CoreStateRequireClientUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? message) fatalError,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function(bool isFullyAuthenticated,
            String? defaultDashboardId, bool fullscreenDashboard)
        userLoaded,
  }) {
    return requireClientUpdate(versionInfo, storeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? message)? fatalError,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
  }) {
    return requireClientUpdate?.call(versionInfo, storeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? message)? fatalError,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
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
    required TResult Function(CoreStateLoading value) loading,
    required TResult Function(CoreStatesFatalError value) fatalError,
    required TResult Function(CoreStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(CoreStateUserLoaded value) userLoaded,
  }) {
    return requireClientUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateLoading value)? loading,
    TResult? Function(CoreStatesFatalError value)? fatalError,
    TResult? Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(CoreStateUserLoaded value)? userLoaded,
  }) {
    return requireClientUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateLoading value)? loading,
    TResult Function(CoreStatesFatalError value)? fatalError,
    TResult Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(CoreStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) {
    if (requireClientUpdate != null) {
      return requireClientUpdate(this);
    }
    return orElse();
  }
}

abstract class CoreStateRequireClientUpdate implements CoreState {
  const factory CoreStateRequireClientUpdate(
          {required final VersionInfo versionInfo,
          required final StoreInfo? storeInfo}) =
      _$CoreStateRequireClientUpdateImpl;

  VersionInfo get versionInfo;
  StoreInfo? get storeInfo;

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoreStateRequireClientUpdateImplCopyWith<
          _$CoreStateRequireClientUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoreStateUserLoadedImplCopyWith<$Res> {
  factory _$$CoreStateUserLoadedImplCopyWith(_$CoreStateUserLoadedImpl value,
          $Res Function(_$CoreStateUserLoadedImpl) then) =
      __$$CoreStateUserLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isFullyAuthenticated,
      String? defaultDashboardId,
      bool fullscreenDashboard});
}

/// @nodoc
class __$$CoreStateUserLoadedImplCopyWithImpl<$Res>
    extends _$CoreStateCopyWithImpl<$Res, _$CoreStateUserLoadedImpl>
    implements _$$CoreStateUserLoadedImplCopyWith<$Res> {
  __$$CoreStateUserLoadedImplCopyWithImpl(_$CoreStateUserLoadedImpl _value,
      $Res Function(_$CoreStateUserLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFullyAuthenticated = null,
    Object? defaultDashboardId = freezed,
    Object? fullscreenDashboard = null,
  }) {
    return _then(_$CoreStateUserLoadedImpl(
      isFullyAuthenticated: null == isFullyAuthenticated
          ? _value.isFullyAuthenticated
          : isFullyAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultDashboardId: freezed == defaultDashboardId
          ? _value.defaultDashboardId
          : defaultDashboardId // ignore: cast_nullable_to_non_nullable
              as String?,
      fullscreenDashboard: null == fullscreenDashboard
          ? _value.fullscreenDashboard
          : fullscreenDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CoreStateUserLoadedImpl implements CoreStateUserLoaded {
  const _$CoreStateUserLoadedImpl(
      {required this.isFullyAuthenticated,
      required this.defaultDashboardId,
      required this.fullscreenDashboard});

  @override
  final bool isFullyAuthenticated;
  @override
  final String? defaultDashboardId;
  @override
  final bool fullscreenDashboard;

  @override
  String toString() {
    return 'CoreState.userLoaded(isFullyAuthenticated: $isFullyAuthenticated, defaultDashboardId: $defaultDashboardId, fullscreenDashboard: $fullscreenDashboard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreStateUserLoadedImpl &&
            (identical(other.isFullyAuthenticated, isFullyAuthenticated) ||
                other.isFullyAuthenticated == isFullyAuthenticated) &&
            (identical(other.defaultDashboardId, defaultDashboardId) ||
                other.defaultDashboardId == defaultDashboardId) &&
            (identical(other.fullscreenDashboard, fullscreenDashboard) ||
                other.fullscreenDashboard == fullscreenDashboard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFullyAuthenticated,
      defaultDashboardId, fullscreenDashboard);

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreStateUserLoadedImplCopyWith<_$CoreStateUserLoadedImpl> get copyWith =>
      __$$CoreStateUserLoadedImplCopyWithImpl<_$CoreStateUserLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? message) fatalError,
    required TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)
        requireClientUpdate,
    required TResult Function(bool isFullyAuthenticated,
            String? defaultDashboardId, bool fullscreenDashboard)
        userLoaded,
  }) {
    return userLoaded(
        isFullyAuthenticated, defaultDashboardId, fullscreenDashboard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? message)? fatalError,
    TResult? Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult? Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
  }) {
    return userLoaded?.call(
        isFullyAuthenticated, defaultDashboardId, fullscreenDashboard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? message)? fatalError,
    TResult Function(VersionInfo versionInfo, StoreInfo? storeInfo)?
        requireClientUpdate,
    TResult Function(bool isFullyAuthenticated, String? defaultDashboardId,
            bool fullscreenDashboard)?
        userLoaded,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(
          isFullyAuthenticated, defaultDashboardId, fullscreenDashboard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateLoading value) loading,
    required TResult Function(CoreStatesFatalError value) fatalError,
    required TResult Function(CoreStateRequireClientUpdate value)
        requireClientUpdate,
    required TResult Function(CoreStateUserLoaded value) userLoaded,
  }) {
    return userLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateLoading value)? loading,
    TResult? Function(CoreStatesFatalError value)? fatalError,
    TResult? Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult? Function(CoreStateUserLoaded value)? userLoaded,
  }) {
    return userLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateLoading value)? loading,
    TResult Function(CoreStatesFatalError value)? fatalError,
    TResult Function(CoreStateRequireClientUpdate value)? requireClientUpdate,
    TResult Function(CoreStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(this);
    }
    return orElse();
  }
}

abstract class CoreStateUserLoaded implements CoreState {
  const factory CoreStateUserLoaded(
      {required final bool isFullyAuthenticated,
      required final String? defaultDashboardId,
      required final bool fullscreenDashboard}) = _$CoreStateUserLoadedImpl;

  bool get isFullyAuthenticated;
  String? get defaultDashboardId;
  bool get fullscreenDashboard;

  /// Create a copy of CoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoreStateUserLoadedImplCopyWith<_$CoreStateUserLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
