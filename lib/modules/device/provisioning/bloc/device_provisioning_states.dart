import 'package:equatable/equatable.dart';

sealed class DeviceProvisioningState extends Equatable {
  const DeviceProvisioningState();

  @override
  List<Object?> get props => [];
}

final class DeviceProvisioningIdleState extends DeviceProvisioningState {
  const DeviceProvisioningIdleState();
}

final class DeviceProvisioningErrorState extends DeviceProvisioningState {
  const DeviceProvisioningErrorState();
}

final class DeviceProvisioningSuccessState extends DeviceProvisioningState {
  const DeviceProvisioningSuccessState();
}

final class DeviceProvisioningConfirmConnection
    extends DeviceProvisioningState {
  const DeviceProvisioningConfirmConnection();
}

final class DeviceProvisioningSendWifiCreds extends DeviceProvisioningState {
  const DeviceProvisioningSendWifiCreds();
}

final class DeviceProvisioningClaimingWipState extends DeviceProvisioningState {
  const DeviceProvisioningClaimingWipState();
}

// final class DeviceProvisioningClaimingDoneState
//     extends DeviceProvisioningState {
//   const DeviceProvisioningClaimingDoneState(this.deviceName);
//
//   final String deviceName;
//
//   @override
//   List<Object?> get props => [deviceName];
// }

final class DeviceProvisioningClaimingErrorState
    extends DeviceProvisioningState {
  const DeviceProvisioningClaimingErrorState(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class DeviceProvisioningReconnectToWifiState
    extends DeviceProvisioningState {
  const DeviceProvisioningReconnectToWifiState();
}
