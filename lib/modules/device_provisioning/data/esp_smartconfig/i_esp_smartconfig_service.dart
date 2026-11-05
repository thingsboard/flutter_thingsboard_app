// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:esp_smartconfig/esp_smartconfig.dart';

enum SmartConfig { espTouch, espTouchV2 }

abstract interface class IEspSmartConfigService {
  Provisioner create(SmartConfig config);

  Future<void> start(ProvisioningRequest request);

  Future<void> stop();
}
