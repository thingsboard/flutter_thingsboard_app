import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart'
    show DeviceProvisioningStatus;
import 'package:thingsboard_app/thingsboard_client.dart' show User;

base class CommunicationEvent extends Equatable {
  const CommunicationEvent();

  @override
  List<Object?> get props => [];
}

final class UserLoggedInEvent extends CommunicationEvent {
  const UserLoggedInEvent(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

final class AlarmAssigneeUpdatedEvent extends CommunicationEvent {
  const AlarmAssigneeUpdatedEvent(this.id);

  final String? id;

  @override
  List<Object?> get props => [];
}

final class DeviceProvisioningStatusChangedEvent extends CommunicationEvent {
  const DeviceProvisioningStatusChangedEvent(this.status);

  final DeviceProvisioningStatus status;

  @override
  List<Object?> get props => [double.nan];
}

final class AppLifecycleStateChangedEvent extends CommunicationEvent {
  const AppLifecycleStateChangedEvent(this.state);

  final AppLifecycleState state;

  @override
  List<Object?> get props => [state];
}
