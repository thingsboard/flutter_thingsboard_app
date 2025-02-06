import 'package:equatable/equatable.dart';

sealed class EspWifiProvisioningEvent extends Equatable {
  const EspWifiProvisioningEvent();

  @override
  List<Object?> get props => [];
}

final class EspWifiScanBleDevicesEvent extends EspWifiProvisioningEvent {
  const EspWifiScanBleDevicesEvent([this.prefix = '']);

  final String prefix;

  @override
  List<Object?> get props => [prefix];
}

final class EspWifiScanNetworksEvent extends EspWifiProvisioningEvent {
  const EspWifiScanNetworksEvent({
    required this.deviceName,
    required this.pop,
  });

  final String deviceName;
  final String pop; // proofOfPossession

  @override
  List<Object?> get props => [pop, deviceName];
}

final class EspWifiProvisionDeviceEvent extends EspWifiProvisioningEvent {
  const EspWifiProvisionDeviceEvent({
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
