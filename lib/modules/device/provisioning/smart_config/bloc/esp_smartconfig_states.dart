import 'package:equatable/equatable.dart';
import 'package:wifi_scan/wifi_scan.dart' show WiFiAccessPoint;

sealed class EspSmartConfigState extends Equatable {
  const EspSmartConfigState();

  @override
  List<Object?> get props => [];
}

final class EspSmartConfigLoadingState extends EspSmartConfigState {
  const EspSmartConfigLoadingState();
}

final class EspSmartConfigEnterNetworkManuallyState
    extends EspSmartConfigState {
  const EspSmartConfigEnterNetworkManuallyState();
}

final class EspSmartConfigWiFiNetworksState extends EspSmartConfigState {
  const EspSmartConfigWiFiNetworksState(this.networks);

  final List<WiFiAccessPoint> networks;

  @override
  List<Object?> get props => [networks];
}

final class EspSmartConfigWipState extends EspSmartConfigState {
  const EspSmartConfigWipState({
    required this.ssid,
    required this.password,
  });

  final String ssid;
  final String password;

  @override
  List<Object?> get props => [ssid, password];
}
