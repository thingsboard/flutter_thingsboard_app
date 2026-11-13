// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';

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

final class DeviceProvisioningClaimingErrorState
    extends DeviceProvisioningState {
  const DeviceProvisioningClaimingErrorState(this.message);

  final TranslationBuilder message;

  @override
  List<Object?> get props => [message];
}

final class DeviceProvisioningReconnectToWifiState
    extends DeviceProvisioningState {
  const DeviceProvisioningReconnectToWifiState();
}
