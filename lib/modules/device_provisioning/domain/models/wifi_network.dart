// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_network.freezed.dart';
part 'wifi_network.g.dart';

@freezed
abstract class WifiNetwork with _$WifiNetwork {
  const factory WifiNetwork({
    required String ssid,
    required int rssi,
    required int channel,
    required String auth,
    @Default('') String password,
  }) = _WifiNetwork;

  factory WifiNetwork.fromJson(Map<String, Object?> json) =>
      _$WifiNetworkFromJson(json);
}
