// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';

class RefreshListenable extends ChangeNotifier {
  RefreshListenable(this._ref) {
    _ref.listen(loginProvider, (current, next) {
      notifyListeners();
    });
    _ref.listen(oauthProvider, (current, next) {
      notifyListeners();
    });
    _ref.listen(navigationProvider, (current, next) {
      notifyListeners();
    });
    getIt<IEndpointService>().listenEndpointChanges.addListener(() {
      notifyListeners();
    });
  }
  final Ref _ref;
}
