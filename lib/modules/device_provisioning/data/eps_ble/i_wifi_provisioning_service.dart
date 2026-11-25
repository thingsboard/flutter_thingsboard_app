// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

abstract interface class IBleProvisioningService {
  Future<List<String>> scanBleDevices(String prefix);

  Future<List<String>> scanWifiNetworks({
    required String deviceName,
    required String proofOfPossession,
  });

  Future<bool?> provisionWifi({
    required String deviceName,
    required String proofOfPossession,
    required String ssid,
    required String passphrase,
  });

  Future<String?> getPlatformVersion();
}
