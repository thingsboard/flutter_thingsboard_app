// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

sealed class EspBleProvisioningEvent extends Equatable {
  const EspBleProvisioningEvent();

  @override
  List<Object?> get props => [];
}

final class EspBleScanNetworksEvent extends EspBleProvisioningEvent {
  const EspBleScanNetworksEvent({
    required this.deviceName,
    required this.pop,
  });

  final String deviceName;
  final String pop; // proofOfPossession

  @override
  List<Object?> get props => [pop, deviceName];
}

final class EspBleProvisionDeviceEvent extends EspBleProvisioningEvent {
  const EspBleProvisionDeviceEvent({
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

final class EspBleProvisioningDoneEvent extends EspBleProvisioningEvent {
  const EspBleProvisioningDoneEvent();
}
