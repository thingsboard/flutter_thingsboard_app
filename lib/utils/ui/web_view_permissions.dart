// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Answers a web page's request for the camera, microphone or similar: only
/// pages of the ThingsBoard server at [endpoint] get them, any other page is
/// refused.
PermissionResponse endpointOnlyPermission(
  PermissionRequest request,
  String endpoint,
) {
  final server = Uri.tryParse(endpoint);
  final origin = request.origin;
  final sameOrigin =
      server != null &&
      origin.scheme == server.scheme &&
      origin.host == server.host &&
      origin.port == server.port;
  return PermissionResponse(
    resources: request.resources,
    action: sameOrigin
        ? PermissionResponseAction.GRANT
        : PermissionResponseAction.DENY,
  );
}
