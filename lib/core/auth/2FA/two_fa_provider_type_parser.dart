// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_client/thingsboard_client.dart';

/// [TwoFaProviderType.valueOf] throws on an unknown name; this tolerant parser
/// returns null instead so callers can skip unrecognized provider types.
TwoFaProviderType? tryParseTwoFaProviderType(String? name) {
  if (name == null) return null;
  try {
    return TwoFaProviderType.valueOf(name);
  } catch (_) {
    return null;
  }
}
