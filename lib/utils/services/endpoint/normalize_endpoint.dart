// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Call sites build URLs as `endpoint + '/api/...'`, so a trailing slash turns
/// into `//api/...`, which the server's `StrictHttpFirewall` rejects with 400.
/// The `://` of a scheme-only value is kept so it is not mangled further.
String normalizeEndpoint(String endpoint) {
  var normalized = endpoint.trim();
  while (normalized.endsWith('/') && !normalized.endsWith('://')) {
    normalized = normalized.substring(0, normalized.length - 1);
  }

  return normalized;
}
