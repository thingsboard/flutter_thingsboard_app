// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

sealed class DeviceProvisioningEvent extends Equatable {
  const DeviceProvisioningEvent();

  @override
  List<Object?> get props => [];
}

final class SendWifiCredentialsEvent extends DeviceProvisioningEvent {
  const SendWifiCredentialsEvent();
}

final class ConfirmConnectionEvent extends DeviceProvisioningEvent {
  const ConfirmConnectionEvent();
}

final class SuccessfullyProvisionedEvent extends DeviceProvisioningEvent {
  const SuccessfullyProvisionedEvent();
}

final class ErrorDuringProvisioningEvent extends DeviceProvisioningEvent {
  const ErrorDuringProvisioningEvent();
}

final class ProvisioningIdleEvent extends DeviceProvisioningEvent {
  const ProvisioningIdleEvent();
}

final class ProceedWithClaimingEvent extends DeviceProvisioningEvent {
  const ProceedWithClaimingEvent();
}
