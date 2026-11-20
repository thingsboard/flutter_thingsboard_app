// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// White-labeling without the network: the default (non-custom) logo and
/// themes, and a count of the reloads asked for.
class FakeWl extends Wl {
  FakeWl({this.customLogo = false});

  final bool customLogo;
  int updates = 0;

  @override
  WlState build() {
    final logoUrl = customLogo
        ? 'tb-image;/api/images/logo.png'
        : defaultLogoUrl;
    return WlState(
      loginWhiteLabelingParams: LoginWhiteLabelingParams(
        (b) => b.logoImageUrl = logoUrl,
      ),
      userParams: WhiteLabelingParams((b) => b.logoImageUrl = logoUrl),
      theme: ThemeData(),
      loginTheme: ThemeData(),
      isUserWlMode: false,
      logo: const SizedBox(key: Key('custom-logo')),
    );
  }

  @override
  Future<void> updateWhiteLabeling() async => updates++;
}
