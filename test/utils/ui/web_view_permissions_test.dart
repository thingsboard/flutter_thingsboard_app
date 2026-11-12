// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/web_view_permissions.dart';

const _endpoint = 'https://tb.example.com:8443';

PermissionResponseAction? _answer(
  String origin, {
  String endpoint = _endpoint,
}) => endpointOnlyPermission(
  PermissionRequest(
    origin: WebUri(origin),
    resources: [PermissionResourceType.CAMERA],
  ),
  endpoint,
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

  test('an http server that redirects to https still gets the camera', () {
    expect(
      _answer(
        'https://tb.example.com/dashboard/1',
        endpoint: 'http://tb.example.com',
      ),
      PermissionResponseAction.GRANT,
    );
  });

  test('https on another host or port is not taken for the http server', () {
    for (final origin in [
      'https://site.example/page',
      'https://tb.example.com:8443/page',
    ]) {
      expect(
        _answer(origin, endpoint: 'http://tb.example.com'),
        PermissionResponseAction.DENY,
        reason: origin,
      );
    }
    expect(
      _answer(
        'https://tb.example.com/page',
        endpoint: 'http://tb.example.com:8080',
      ),
      PermissionResponseAction.DENY,
    );
  });

  test('an https server does not cover its http pages', () {
    expect(
      _answer('http://tb.example.com/page', endpoint: 'https://tb.example.com'),
      PermissionResponseAction.DENY,
    );
  });
}
