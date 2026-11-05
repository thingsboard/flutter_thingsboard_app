// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/asset/asset_details_page.dart';
import 'package:thingsboard_app/modules/asset/assets_page.dart';

class AssetRoutes {
  static const assets = '/assets';
  static const asset = '/asset';
}

// Asset management routes
final assetRoutes = [
  GoRoute(
    path: AssetRoutes.assets,
    builder: (context, state) {
      final searchMode = state.uri.queryParameters['search'] == 'true';
      return AssetsPage(searchMode: searchMode);
    },
  ),
  GoRoute(
    path: '${AssetRoutes.asset}/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;

      return AssetDetailsPage(id);
    },
  ),
];
