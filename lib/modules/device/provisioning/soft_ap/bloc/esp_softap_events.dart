import 'package:equatable/equatable.dart';

sealed class EspSoftApEvent extends Equatable {
  const EspSoftApEvent();

  @override
  List<Object?> get props => [];
}

final class EspSoftApConnectToDeviceEvent extends EspSoftApEvent {
  const EspSoftApConnectToDeviceEvent(this.pop);

  final String pop;

  @override
  List<Object?> get props => [pop];
}

final class EspSoftApStartProvisioningEvent extends EspSoftApEvent {
  const EspSoftApStartProvisioningEvent({
    required this.ssid,
    required this.password,
  });

  final String ssid;
  final String password;

  @override
  List<Object?> get props => [ssid, password];
}

final class EspSoftApAutoConnectToDeviceWifi extends EspSoftApEvent {
  const EspSoftApAutoConnectToDeviceWifi();
}

final class EspSoftApManuallyConnectToDeviceWifi extends EspSoftApEvent {
  const EspSoftApManuallyConnectToDeviceWifi();
}

final class EspSoftApProvisioningDoneEvent extends EspSoftApEvent {
  const EspSoftApProvisioningDoneEvent();
}
