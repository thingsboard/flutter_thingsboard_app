// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeEventFetchImplCopyWith<$Res> {
  factory _$$HomeEventFetchImplCopyWith(_$HomeEventFetchImpl value,
          $Res Function(_$HomeEventFetchImpl) then) =
      __$$HomeEventFetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeEventFetchImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeEventFetchImpl>
    implements _$$HomeEventFetchImplCopyWith<$Res> {
  __$$HomeEventFetchImplCopyWithImpl(
      _$HomeEventFetchImpl _value, $Res Function(_$HomeEventFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeEventFetchImpl implements HomeEventFetch {
  const _$HomeEventFetchImpl();

  @override
  String toString() {
    return 'HomeEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeEventFetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
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
    required TResult Function(HomeEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class HomeEventFetch implements HomeEvent {
  const factory HomeEventFetch() = _$HomeEventFetchImpl;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)
        homeDashboard,
    required TResult Function() dashboards,
    required TResult Function() sysadmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult? Function()? dashboards,
    TResult? Function()? sysadmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult Function()? dashboards,
    TResult Function()? sysadmin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeDashboardState value) homeDashboard,
    required TResult Function(HomeStateDashboards value) dashboards,
    required TResult Function(HomeStateSysadmin value) sysadmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeDashboardState value)? homeDashboard,
    TResult? Function(HomeStateDashboards value)? dashboards,
    TResult? Function(HomeStateSysadmin value)? sysadmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeDashboardState value)? homeDashboard,
    TResult Function(HomeStateDashboards value)? dashboards,
    TResult Function(HomeStateSysadmin value)? sysadmin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeStateLoadingImplCopyWith<$Res> {
  factory _$$HomeStateLoadingImplCopyWith(_$HomeStateLoadingImpl value,
          $Res Function(_$HomeStateLoadingImpl) then) =
      __$$HomeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoadingImpl>
    implements _$$HomeStateLoadingImplCopyWith<$Res> {
  __$$HomeStateLoadingImplCopyWithImpl(_$HomeStateLoadingImpl _value,
      $Res Function(_$HomeStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateLoadingImpl implements HomeStateLoading {
  const _$HomeStateLoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)
        homeDashboard,
    required TResult Function() dashboards,
    required TResult Function() sysadmin,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult? Function()? dashboards,
    TResult? Function()? sysadmin,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult Function()? dashboards,
    TResult Function()? sysadmin,
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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeDashboardState value) homeDashboard,
    required TResult Function(HomeStateDashboards value) dashboards,
    required TResult Function(HomeStateSysadmin value) sysadmin,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeDashboardState value)? homeDashboard,
    TResult? Function(HomeStateDashboards value)? dashboards,
    TResult? Function(HomeStateSysadmin value)? sysadmin,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeDashboardState value)? homeDashboard,
    TResult Function(HomeStateDashboards value)? dashboards,
    TResult Function(HomeStateSysadmin value)? sysadmin,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoading implements HomeState {
  const factory HomeStateLoading() = _$HomeStateLoadingImpl;
}

/// @nodoc
abstract class _$$HomeDashboardStateImplCopyWith<$Res> {
  factory _$$HomeDashboardStateImplCopyWith(_$HomeDashboardStateImpl value,
          $Res Function(_$HomeDashboardStateImpl) then) =
      __$$HomeDashboardStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HomeDashboardInfo homeDashboard, bool isSysadmin});
}

/// @nodoc
class __$$HomeDashboardStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeDashboardStateImpl>
    implements _$$HomeDashboardStateImplCopyWith<$Res> {
  __$$HomeDashboardStateImplCopyWithImpl(_$HomeDashboardStateImpl _value,
      $Res Function(_$HomeDashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeDashboard = null,
    Object? isSysadmin = null,
  }) {
    return _then(_$HomeDashboardStateImpl(
      null == homeDashboard
          ? _value.homeDashboard
          : homeDashboard // ignore: cast_nullable_to_non_nullable
              as HomeDashboardInfo,
      isSysadmin: null == isSysadmin
          ? _value.isSysadmin
          : isSysadmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeDashboardStateImpl implements HomeDashboardState {
  const _$HomeDashboardStateImpl(this.homeDashboard,
      {required this.isSysadmin});

  @override
  final HomeDashboardInfo homeDashboard;
  @override
  final bool isSysadmin;

  @override
  String toString() {
    return 'HomeState.homeDashboard(homeDashboard: $homeDashboard, isSysadmin: $isSysadmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDashboardStateImpl &&
            (identical(other.homeDashboard, homeDashboard) ||
                other.homeDashboard == homeDashboard) &&
            (identical(other.isSysadmin, isSysadmin) ||
                other.isSysadmin == isSysadmin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, homeDashboard, isSysadmin);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDashboardStateImplCopyWith<_$HomeDashboardStateImpl> get copyWith =>
      __$$HomeDashboardStateImplCopyWithImpl<_$HomeDashboardStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)
        homeDashboard,
    required TResult Function() dashboards,
    required TResult Function() sysadmin,
  }) {
    return homeDashboard(this.homeDashboard, isSysadmin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult? Function()? dashboards,
    TResult? Function()? sysadmin,
  }) {
    return homeDashboard?.call(this.homeDashboard, isSysadmin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult Function()? dashboards,
    TResult Function()? sysadmin,
    required TResult orElse(),
  }) {
    if (homeDashboard != null) {
      return homeDashboard(this.homeDashboard, isSysadmin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeDashboardState value) homeDashboard,
    required TResult Function(HomeStateDashboards value) dashboards,
    required TResult Function(HomeStateSysadmin value) sysadmin,
  }) {
    return homeDashboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeDashboardState value)? homeDashboard,
    TResult? Function(HomeStateDashboards value)? dashboards,
    TResult? Function(HomeStateSysadmin value)? sysadmin,
  }) {
    return homeDashboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeDashboardState value)? homeDashboard,
    TResult Function(HomeStateDashboards value)? dashboards,
    TResult Function(HomeStateSysadmin value)? sysadmin,
    required TResult orElse(),
  }) {
    if (homeDashboard != null) {
      return homeDashboard(this);
    }
    return orElse();
  }
}

abstract class HomeDashboardState implements HomeState {
  const factory HomeDashboardState(final HomeDashboardInfo homeDashboard,
      {required final bool isSysadmin}) = _$HomeDashboardStateImpl;

  HomeDashboardInfo get homeDashboard;
  bool get isSysadmin;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDashboardStateImplCopyWith<_$HomeDashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateDashboardsImplCopyWith<$Res> {
  factory _$$HomeStateDashboardsImplCopyWith(_$HomeStateDashboardsImpl value,
          $Res Function(_$HomeStateDashboardsImpl) then) =
      __$$HomeStateDashboardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateDashboardsImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateDashboardsImpl>
    implements _$$HomeStateDashboardsImplCopyWith<$Res> {
  __$$HomeStateDashboardsImplCopyWithImpl(_$HomeStateDashboardsImpl _value,
      $Res Function(_$HomeStateDashboardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateDashboardsImpl implements HomeStateDashboards {
  const _$HomeStateDashboardsImpl();

  @override
  String toString() {
    return 'HomeState.dashboards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateDashboardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)
        homeDashboard,
    required TResult Function() dashboards,
    required TResult Function() sysadmin,
  }) {
    return dashboards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult? Function()? dashboards,
    TResult? Function()? sysadmin,
  }) {
    return dashboards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult Function()? dashboards,
    TResult Function()? sysadmin,
    required TResult orElse(),
  }) {
    if (dashboards != null) {
      return dashboards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeDashboardState value) homeDashboard,
    required TResult Function(HomeStateDashboards value) dashboards,
    required TResult Function(HomeStateSysadmin value) sysadmin,
  }) {
    return dashboards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeDashboardState value)? homeDashboard,
    TResult? Function(HomeStateDashboards value)? dashboards,
    TResult? Function(HomeStateSysadmin value)? sysadmin,
  }) {
    return dashboards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeDashboardState value)? homeDashboard,
    TResult Function(HomeStateDashboards value)? dashboards,
    TResult Function(HomeStateSysadmin value)? sysadmin,
    required TResult orElse(),
  }) {
    if (dashboards != null) {
      return dashboards(this);
    }
    return orElse();
  }
}

abstract class HomeStateDashboards implements HomeState {
  const factory HomeStateDashboards() = _$HomeStateDashboardsImpl;
}

/// @nodoc
abstract class _$$HomeStateSysadminImplCopyWith<$Res> {
  factory _$$HomeStateSysadminImplCopyWith(_$HomeStateSysadminImpl value,
          $Res Function(_$HomeStateSysadminImpl) then) =
      __$$HomeStateSysadminImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateSysadminImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateSysadminImpl>
    implements _$$HomeStateSysadminImplCopyWith<$Res> {
  __$$HomeStateSysadminImplCopyWithImpl(_$HomeStateSysadminImpl _value,
      $Res Function(_$HomeStateSysadminImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateSysadminImpl implements HomeStateSysadmin {
  const _$HomeStateSysadminImpl();

  @override
  String toString() {
    return 'HomeState.sysadmin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateSysadminImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)
        homeDashboard,
    required TResult Function() dashboards,
    required TResult Function() sysadmin,
  }) {
    return sysadmin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult? Function()? dashboards,
    TResult? Function()? sysadmin,
  }) {
    return sysadmin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HomeDashboardInfo homeDashboard, bool isSysadmin)?
        homeDashboard,
    TResult Function()? dashboards,
    TResult Function()? sysadmin,
    required TResult orElse(),
  }) {
    if (sysadmin != null) {
      return sysadmin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeDashboardState value) homeDashboard,
    required TResult Function(HomeStateDashboards value) dashboards,
    required TResult Function(HomeStateSysadmin value) sysadmin,
  }) {
    return sysadmin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeDashboardState value)? homeDashboard,
    TResult? Function(HomeStateDashboards value)? dashboards,
    TResult? Function(HomeStateSysadmin value)? sysadmin,
  }) {
    return sysadmin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeDashboardState value)? homeDashboard,
    TResult Function(HomeStateDashboards value)? dashboards,
    TResult Function(HomeStateSysadmin value)? sysadmin,
    required TResult orElse(),
  }) {
    if (sysadmin != null) {
      return sysadmin(this);
    }
    return orElse();
  }
}

abstract class HomeStateSysadmin implements HomeState {
  const factory HomeStateSysadmin() = _$HomeStateSysadminImpl;
}
