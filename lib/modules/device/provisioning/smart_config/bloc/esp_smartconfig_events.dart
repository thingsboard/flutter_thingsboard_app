import 'package:equatable/equatable.dart';

sealed class EspSmartConfigEvent extends Equatable {
  const EspSmartConfigEvent();

  @override
  List<Object?> get props => [];
}

final class EspSmartConfigScanNetworksEvent extends EspSmartConfigEvent {
  const EspSmartConfigScanNetworksEvent();
}

final class EspSmartConfigStartEvent extends EspSmartConfigEvent {
  const EspSmartConfigStartEvent({
    required this.ssid,
    required this.password,
    required this.aesKey,
  });

  final String ssid;
  final String password;
  final String aesKey;

  @override
  List<Object?> get props => [ssid, password, aesKey];
}
