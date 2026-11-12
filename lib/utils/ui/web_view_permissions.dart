// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Answers a web page's request for the camera, microphone or similar: only
/// pages of the ThingsBoard server at [endpoint] get them, any other page is
/// refused.
///
/// An `http` endpoint on the default port also covers the same host over
/// `https` on the default port: a server that redirects to HTTPS is still the
/// same server, and the camera only works on HTTPS pages anyway.
PermissionResponse endpointOnlyPermission(
  PermissionRequest request,
  String endpoint,
) {
  final server = Uri.tryParse(endpoint);
  final origin = request.origin;
  final sameServer =
      server != null &&
      origin.host == server.host &&
      ((origin.scheme == server.scheme && origin.port == server.port) ||
          _isHttpsUpgrade(server, origin));
  return PermissionResponse(
    resources: request.resources,
    action: sameServer
        ? PermissionResponseAction.GRANT
        : PermissionResponseAction.DENY,
  );
}

bool _isHttpsUpgrade(Uri server, Uri origin) =>
    server.scheme == 'http' &&
    server.port == 80 &&
    origin.scheme == 'https' &&
    origin.port == 443;
