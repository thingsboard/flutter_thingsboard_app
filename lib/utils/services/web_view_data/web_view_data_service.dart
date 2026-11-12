// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/utils/services/web_view_data/i_web_view_data_service.dart';

class WebViewDataService implements IWebViewDataService {
  @override
  Future<void> clear() async {
    await CookieManager.instance().deleteAllCookies();
    final storage = WebStorageManager.instance();
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      // iOS has no deleteAllData: remove everything since the beginning.
      await storage.removeDataModifiedSince(
        dataTypes: WebsiteDataType.ALL,
        date: DateTime.fromMillisecondsSinceEpoch(0),
      );
    } else {
      await storage.deleteAllData();
    }
  }
}
