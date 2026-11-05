// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

abstract final class EnvironmentVariables {
  static const apiCalls =
      bool.fromEnvironment('API_CALLS');
  static const verbose = bool.fromEnvironment('VERBOSE');
  static const showAppVersion = bool.fromEnvironment('showAppVersion');
}
