import 'package:equatable/equatable.dart';

sealed class EspSoftApState extends Equatable {
  const EspSoftApState();

  @override
  List<Object?> get props => [];
}

final class EspSoftAppLoadingState extends EspSoftApState {
  const EspSoftAppLoadingState();
}

final class EspConnectToDeviceNetworkState extends EspSoftApState {
  const EspConnectToDeviceNetworkState();
}

final class EspSoftApErrorState extends EspSoftApState {
  const EspSoftApErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class EspSoftApWiFiListState extends EspSoftApState {
  const EspSoftApWiFiListState(this.wifiList);

  final List<Map<String, dynamic>> wifiList;

  @override
  List<Object?> get props => [wifiList];
}

final class EspSoftApProvisionedSuccessfullyState extends EspSoftApState {
  const EspSoftApProvisionedSuccessfullyState();
}
