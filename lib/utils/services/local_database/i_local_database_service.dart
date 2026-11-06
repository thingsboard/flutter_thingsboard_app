// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/select_region/model/region.dart';

/// The aim of this service is to consolidate operations with
/// the local database provider into one centralized location.

abstract interface class ILocalDatabaseService {
  Future<Region?> getSelectedRegion();

  Future<void> saveSelectedRegion(Region region);

  Future<String?> getSelectedEndpoint();

  Future<void> setSelectedEndpoint(String endpoint);

  Future<void> setInitialAppLink(String appLink);

  Future<String?> getInitialAppLink();

  Future<void> deleteInitialAppLink();

  Future<bool> isPushRegistered();

  Future<void> setPushRegistered();

  Future<void> clearPushRegistered();
}
