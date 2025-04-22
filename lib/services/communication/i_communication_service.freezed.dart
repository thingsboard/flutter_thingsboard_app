// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'i_communication_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunicationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(String? id) alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatus status)
        provisioningStatus,
    required TResult Function(AppLifecycleState state) lifecycle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(String? id)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult? Function(AppLifecycleState state)? lifecycle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(String? id)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult Function(AppLifecycleState state)? lifecycle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GlobalLogoutEvent value) logout,
    required TResult Function(AlarmAssigneeUpdatedEvent value)
        alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatusChangedEvent value)
        provisioningStatus,
    required TResult Function(AppLifecycleStateChangedEvent value) lifecycle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GlobalLogoutEvent value)? logout,
    TResult? Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult? Function(AppLifecycleStateChangedEvent value)? lifecycle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GlobalLogoutEvent value)? logout,
    TResult Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult Function(AppLifecycleStateChangedEvent value)? lifecycle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationEventCopyWith<$Res> {
  factory $CommunicationEventCopyWith(
          CommunicationEvent value, $Res Function(CommunicationEvent) then) =
      _$CommunicationEventCopyWithImpl<$Res, CommunicationEvent>;
}

/// @nodoc
class _$CommunicationEventCopyWithImpl<$Res, $Val extends CommunicationEvent>
    implements $CommunicationEventCopyWith<$Res> {
  _$CommunicationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GlobalLogoutEventImplCopyWith<$Res> {
  factory _$$GlobalLogoutEventImplCopyWith(_$GlobalLogoutEventImpl value,
          $Res Function(_$GlobalLogoutEventImpl) then) =
      __$$GlobalLogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GlobalLogoutEventImplCopyWithImpl<$Res>
    extends _$CommunicationEventCopyWithImpl<$Res, _$GlobalLogoutEventImpl>
    implements _$$GlobalLogoutEventImplCopyWith<$Res> {
  __$$GlobalLogoutEventImplCopyWithImpl(_$GlobalLogoutEventImpl _value,
      $Res Function(_$GlobalLogoutEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GlobalLogoutEventImpl extends GlobalLogoutEvent {
  const _$GlobalLogoutEventImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(String? id) alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatus status)
        provisioningStatus,
    required TResult Function(AppLifecycleState state) lifecycle,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(String? id)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult? Function(AppLifecycleState state)? lifecycle,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(String? id)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult Function(AppLifecycleState state)? lifecycle,
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
    required TResult Function(GlobalLogoutEvent value) logout,
    required TResult Function(AlarmAssigneeUpdatedEvent value)
        alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatusChangedEvent value)
        provisioningStatus,
    required TResult Function(AppLifecycleStateChangedEvent value) lifecycle,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GlobalLogoutEvent value)? logout,
    TResult? Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult? Function(AppLifecycleStateChangedEvent value)? lifecycle,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GlobalLogoutEvent value)? logout,
    TResult Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult Function(AppLifecycleStateChangedEvent value)? lifecycle,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class GlobalLogoutEvent extends CommunicationEvent {
  const factory GlobalLogoutEvent() = _$GlobalLogoutEventImpl;
  const GlobalLogoutEvent._() : super._();
}

/// @nodoc
abstract class _$$AlarmAssigneeUpdatedEventImplCopyWith<$Res> {
  factory _$$AlarmAssigneeUpdatedEventImplCopyWith(
          _$AlarmAssigneeUpdatedEventImpl value,
          $Res Function(_$AlarmAssigneeUpdatedEventImpl) then) =
      __$$AlarmAssigneeUpdatedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$AlarmAssigneeUpdatedEventImplCopyWithImpl<$Res>
    extends _$CommunicationEventCopyWithImpl<$Res,
        _$AlarmAssigneeUpdatedEventImpl>
    implements _$$AlarmAssigneeUpdatedEventImplCopyWith<$Res> {
  __$$AlarmAssigneeUpdatedEventImplCopyWithImpl(
      _$AlarmAssigneeUpdatedEventImpl _value,
      $Res Function(_$AlarmAssigneeUpdatedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$AlarmAssigneeUpdatedEventImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AlarmAssigneeUpdatedEventImpl extends AlarmAssigneeUpdatedEvent {
  const _$AlarmAssigneeUpdatedEventImpl(this.id) : super._();

  @override
  final String? id;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmAssigneeUpdatedEventImplCopyWith<_$AlarmAssigneeUpdatedEventImpl>
      get copyWith => __$$AlarmAssigneeUpdatedEventImplCopyWithImpl<
          _$AlarmAssigneeUpdatedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(String? id) alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatus status)
        provisioningStatus,
    required TResult Function(AppLifecycleState state) lifecycle,
  }) {
    return alarmAssigneeUpdate(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(String? id)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult? Function(AppLifecycleState state)? lifecycle,
  }) {
    return alarmAssigneeUpdate?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(String? id)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult Function(AppLifecycleState state)? lifecycle,
    required TResult orElse(),
  }) {
    if (alarmAssigneeUpdate != null) {
      return alarmAssigneeUpdate(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GlobalLogoutEvent value) logout,
    required TResult Function(AlarmAssigneeUpdatedEvent value)
        alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatusChangedEvent value)
        provisioningStatus,
    required TResult Function(AppLifecycleStateChangedEvent value) lifecycle,
  }) {
    return alarmAssigneeUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GlobalLogoutEvent value)? logout,
    TResult? Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult? Function(AppLifecycleStateChangedEvent value)? lifecycle,
  }) {
    return alarmAssigneeUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GlobalLogoutEvent value)? logout,
    TResult Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult Function(AppLifecycleStateChangedEvent value)? lifecycle,
    required TResult orElse(),
  }) {
    if (alarmAssigneeUpdate != null) {
      return alarmAssigneeUpdate(this);
    }
    return orElse();
  }
}

abstract class AlarmAssigneeUpdatedEvent extends CommunicationEvent {
  const factory AlarmAssigneeUpdatedEvent(final String? id) =
      _$AlarmAssigneeUpdatedEventImpl;
  const AlarmAssigneeUpdatedEvent._() : super._();

  String? get id;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlarmAssigneeUpdatedEventImplCopyWith<_$AlarmAssigneeUpdatedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceProvisioningStatusChangedEventImplCopyWith<$Res> {
  factory _$$DeviceProvisioningStatusChangedEventImplCopyWith(
          _$DeviceProvisioningStatusChangedEventImpl value,
          $Res Function(_$DeviceProvisioningStatusChangedEventImpl) then) =
      __$$DeviceProvisioningStatusChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceProvisioningStatus status});
}

/// @nodoc
class __$$DeviceProvisioningStatusChangedEventImplCopyWithImpl<$Res>
    extends _$CommunicationEventCopyWithImpl<$Res,
        _$DeviceProvisioningStatusChangedEventImpl>
    implements _$$DeviceProvisioningStatusChangedEventImplCopyWith<$Res> {
  __$$DeviceProvisioningStatusChangedEventImplCopyWithImpl(
      _$DeviceProvisioningStatusChangedEventImpl _value,
      $Res Function(_$DeviceProvisioningStatusChangedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$DeviceProvisioningStatusChangedEventImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceProvisioningStatus,
    ));
  }
}

/// @nodoc

class _$DeviceProvisioningStatusChangedEventImpl
    extends DeviceProvisioningStatusChangedEvent {
  const _$DeviceProvisioningStatusChangedEventImpl(this.status) : super._();

  @override
  final DeviceProvisioningStatus status;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceProvisioningStatusChangedEventImplCopyWith<
          _$DeviceProvisioningStatusChangedEventImpl>
      get copyWith => __$$DeviceProvisioningStatusChangedEventImplCopyWithImpl<
          _$DeviceProvisioningStatusChangedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(String? id) alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatus status)
        provisioningStatus,
    required TResult Function(AppLifecycleState state) lifecycle,
  }) {
    return provisioningStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(String? id)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult? Function(AppLifecycleState state)? lifecycle,
  }) {
    return provisioningStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(String? id)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult Function(AppLifecycleState state)? lifecycle,
    required TResult orElse(),
  }) {
    if (provisioningStatus != null) {
      return provisioningStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GlobalLogoutEvent value) logout,
    required TResult Function(AlarmAssigneeUpdatedEvent value)
        alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatusChangedEvent value)
        provisioningStatus,
    required TResult Function(AppLifecycleStateChangedEvent value) lifecycle,
  }) {
    return provisioningStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GlobalLogoutEvent value)? logout,
    TResult? Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult? Function(AppLifecycleStateChangedEvent value)? lifecycle,
  }) {
    return provisioningStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GlobalLogoutEvent value)? logout,
    TResult Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult Function(AppLifecycleStateChangedEvent value)? lifecycle,
    required TResult orElse(),
  }) {
    if (provisioningStatus != null) {
      return provisioningStatus(this);
    }
    return orElse();
  }
}

abstract class DeviceProvisioningStatusChangedEvent extends CommunicationEvent {
  const factory DeviceProvisioningStatusChangedEvent(
          final DeviceProvisioningStatus status) =
      _$DeviceProvisioningStatusChangedEventImpl;
  const DeviceProvisioningStatusChangedEvent._() : super._();

  DeviceProvisioningStatus get status;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceProvisioningStatusChangedEventImplCopyWith<
          _$DeviceProvisioningStatusChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppLifecycleStateChangedEventImplCopyWith<$Res> {
  factory _$$AppLifecycleStateChangedEventImplCopyWith(
          _$AppLifecycleStateChangedEventImpl value,
          $Res Function(_$AppLifecycleStateChangedEventImpl) then) =
      __$$AppLifecycleStateChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLifecycleState state});
}

/// @nodoc
class __$$AppLifecycleStateChangedEventImplCopyWithImpl<$Res>
    extends _$CommunicationEventCopyWithImpl<$Res,
        _$AppLifecycleStateChangedEventImpl>
    implements _$$AppLifecycleStateChangedEventImplCopyWith<$Res> {
  __$$AppLifecycleStateChangedEventImplCopyWithImpl(
      _$AppLifecycleStateChangedEventImpl _value,
      $Res Function(_$AppLifecycleStateChangedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$AppLifecycleStateChangedEventImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
    ));
  }
}

/// @nodoc

class _$AppLifecycleStateChangedEventImpl
    extends AppLifecycleStateChangedEvent {
  const _$AppLifecycleStateChangedEventImpl(this.state) : super._();

  @override
  final AppLifecycleState state;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLifecycleStateChangedEventImplCopyWith<
          _$AppLifecycleStateChangedEventImpl>
      get copyWith => __$$AppLifecycleStateChangedEventImplCopyWithImpl<
          _$AppLifecycleStateChangedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(String? id) alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatus status)
        provisioningStatus,
    required TResult Function(AppLifecycleState state) lifecycle,
  }) {
    return lifecycle(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(String? id)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult? Function(AppLifecycleState state)? lifecycle,
  }) {
    return lifecycle?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(String? id)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatus status)? provisioningStatus,
    TResult Function(AppLifecycleState state)? lifecycle,
    required TResult orElse(),
  }) {
    if (lifecycle != null) {
      return lifecycle(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GlobalLogoutEvent value) logout,
    required TResult Function(AlarmAssigneeUpdatedEvent value)
        alarmAssigneeUpdate,
    required TResult Function(DeviceProvisioningStatusChangedEvent value)
        provisioningStatus,
    required TResult Function(AppLifecycleStateChangedEvent value) lifecycle,
  }) {
    return lifecycle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GlobalLogoutEvent value)? logout,
    TResult? Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult? Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult? Function(AppLifecycleStateChangedEvent value)? lifecycle,
  }) {
    return lifecycle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GlobalLogoutEvent value)? logout,
    TResult Function(AlarmAssigneeUpdatedEvent value)? alarmAssigneeUpdate,
    TResult Function(DeviceProvisioningStatusChangedEvent value)?
        provisioningStatus,
    TResult Function(AppLifecycleStateChangedEvent value)? lifecycle,
    required TResult orElse(),
  }) {
    if (lifecycle != null) {
      return lifecycle(this);
    }
    return orElse();
  }
}

abstract class AppLifecycleStateChangedEvent extends CommunicationEvent {
  const factory AppLifecycleStateChangedEvent(final AppLifecycleState state) =
      _$AppLifecycleStateChangedEventImpl;
  const AppLifecycleStateChangedEvent._() : super._();

  AppLifecycleState get state;

  /// Create a copy of CommunicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLifecycleStateChangedEventImplCopyWith<
          _$AppLifecycleStateChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
