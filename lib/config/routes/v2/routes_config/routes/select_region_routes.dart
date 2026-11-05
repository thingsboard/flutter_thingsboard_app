// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/core/select_region/choose_region_screen.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/core/select_region/select_region_screen.dart';

abstract final class SelectRegionRoutes {
  static const selectRegion = '/selectRegion';
  static const chooseRegion = '/chooseRegion';
}


final selectRegionRoutes = [
  GoRoute(
    path: SelectRegionRoutes.selectRegion,
    builder: (context, state) {
      return const SelectRegionScreen();
    },
  ),
  GoRoute(
    path: SelectRegionRoutes.chooseRegion,
    builder: (context, state) {
      final region = Region.regionFromString(state.uri.queryParameters['region'].toString());

      return  ChooseRegionScreen(selectedRegion: region,);
    },
  ),
];
