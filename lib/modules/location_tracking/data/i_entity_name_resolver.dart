// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Resolves an entity's display name from its type + id. Returns null on any
/// failure (offline, deleted entity, unknown type) so callers fall back.
abstract interface class IEntityNameResolver {
  Future<String?> resolveName(String entityType, String id);
}
