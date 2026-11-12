// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// What the app's web pages keep on the device: cookies and web storage.
abstract interface class IWebViewDataService {
  /// Removes the cookies and the web storage of every page the app showed,
  /// such as the session the dashboard pages keep in local storage.
  Future<void> clear();
}
