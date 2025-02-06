sealed class DeviceProvisioningState {
  const DeviceProvisioningState();
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
