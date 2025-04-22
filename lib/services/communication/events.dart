part of 'i_communication_service.dart';

@freezed
class CommunicationEvent extends AppEvent with _$CommunicationEvent {
  const CommunicationEvent._();

  const factory CommunicationEvent.logout() = GlobalLogoutEvent;

  const factory CommunicationEvent.alarmAssigneeUpdate(String? id) =
      AlarmAssigneeUpdatedEvent;

  const factory CommunicationEvent.provisioningStatus(
    DeviceProvisioningStatus status,
  ) = DeviceProvisioningStatusChangedEvent;

  const factory CommunicationEvent.lifecycle(AppLifecycleState state) =
      AppLifecycleStateChangedEvent;

  @override
  List<Object?> get props => [];
}
