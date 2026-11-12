// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/web_view_permissions.dart';

const _endpoint = 'https://tb.example.com:8443';

PermissionResponseAction? _answer(String origin) => endpointOnlyPermission(
  PermissionRequest(
    origin: WebUri(origin),
    resources: [PermissionResourceType.CAMERA],
  ),
  _endpoint,
).action;

void main() {
  test('a page of the ThingsBoard server gets the camera', () {
    expect(
      _answer('https://tb.example.com:8443/dashboard/1'),
      PermissionResponseAction.GRANT,
    );
  });

  test('a page of another site does not get the camera', () {
    expect(_answer('https://site.example/page'), PermissionResponseAction.DENY);
  });

  test('another port of the same host does not get the camera', () {
    expect(
      _answer('https://tb.example.com:9443/page'),
      PermissionResponseAction.DENY,
    );
  });
}
