// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'cached_device_profile.freezed.dart';

@freezed
abstract class CachedDeviceProfileInfo with _$CachedDeviceProfileInfo {
  const factory CachedDeviceProfileInfo({
    required int? activeCount,
    required int? inactiveCount,
    required DeviceProfileInfo info,
  }) = _CachedDeviceProfileInfo;
}
