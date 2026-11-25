// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_client/thingsboard_client.dart';

/// Converts the generated client's per-type page data (`PageDataAlarmInfo`,
/// `PageDataUserInfo`, …) into the `PageData<T>` the app's pagination uses.
/// Pass the `built_value` getters directly.
PageData<T> toPageData<T>(
  Iterable<T>? data,
  int? totalPages,
  int? totalElements,
  bool? hasNext,
) {
  return PageData<T>(
    data?.toList() ?? <T>[],
    totalPages ?? 0,
    totalElements ?? 0,
    hasNext ?? false,
  );
}
