import 'package:equatable/equatable.dart';

sealed class EspWifiProvisioningState extends Equatable {
  const EspWifiProvisioningState();

  @override
  List<Object?> get props => [];
}

final class EspWifiLoadingState extends EspWifiProvisioningState {
  const EspWifiLoadingState();
}

final class EspBlePermissionsMissing extends EspWifiProvisioningState {
  const EspBlePermissionsMissing();
}

final class EspWifiBleDevicesState extends EspWifiProvisioningState {
  const EspWifiBleDevicesState(this.devices);

  final List<String> devices;

  @override
  List<Object?> get props => [devices];
}

final class EspEstablishSessionError extends EspWifiProvisioningState {
  const EspEstablishSessionError(this.deviceName);

  final String deviceName;

  @override
  List<Object?> get props => [deviceName];
}

final class EspWifiNetworksState extends EspWifiProvisioningState {
  const EspWifiNetworksState(
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

final class EspWifiProvisioningInProgressState
    extends EspWifiProvisioningState {
  const EspWifiProvisioningInProgressState({
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
