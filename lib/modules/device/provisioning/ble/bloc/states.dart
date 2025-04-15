import 'package:equatable/equatable.dart';

sealed class EspBleProvisioningState extends Equatable {
  const EspBleProvisioningState();

  @override
  List<Object?> get props => [];
}

final class EspBleLoadingState extends EspBleProvisioningState {
  const EspBleLoadingState();
}

final class EspBlePermissionsMissing extends EspBleProvisioningState {
  const EspBlePermissionsMissing({
    required this.openAppSettings,
    required this.permissions,
  });

  final bool openAppSettings;
  final String permissions;

  @override
  List<Object?> get props => [openAppSettings, permissions];
}

final class EspEstablishSessionError extends EspBleProvisioningState {
  const EspEstablishSessionError(this.deviceName);

  final String deviceName;

  @override
  List<Object?> get props => [deviceName];
}

final class EspBleNetworksState extends EspBleProvisioningState {
  const EspBleNetworksState(
    this.networks, {
    required this.device,
    required this.pop,
  });

  final List<String> networks;
  final String device;
  final String pop;

  @override
  List<Object?> get props => [networks, device, pop];
}

final class EspBleProvisioningInProgressState extends EspBleProvisioningState {
  const EspBleProvisioningInProgressState({
    required this.device,
    required this.pop,
    required this.ssid,
    required this.pass,
  });

  final String device;
  final String pop;
  final String ssid;
  final String pass;

  @override
  List<Object?> get props => [device, pop, ssid, pass];
}

final class EspBleProvisioningDoneState extends EspBleProvisioningState {
  const EspBleProvisioningDoneState();
}
