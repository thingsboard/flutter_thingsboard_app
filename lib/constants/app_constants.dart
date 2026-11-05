// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


abstract final class ThingsboardAppConstants {
  static const thingsBoardApiEndpoint = String.fromEnvironment(
    'thingsboardApiEndpoint',
  );
  static const thingsboardOAuth2CallbackUrlScheme = String.fromEnvironment(
    'thingsboardOAuth2CallbackUrlScheme',
  );
  static const thingsboardIOSAppSecret = String.fromEnvironment(
    'thingsboardIosAppSecret',
  );
  static const thingsboardAndroidAppSecret = String.fromEnvironment(
    'thingsboardAndroidAppSecret',
  );
  static const ignoreRegionSelection = thingsBoardApiEndpoint != '';
}
