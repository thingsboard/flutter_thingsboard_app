// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/more/more_page.dart';

class MoreRoutes {
  static const more = '/more';
}

// More routes
final List<GoRoute> moreRoutes = [
  GoRoute(
    path: MoreRoutes.more,
    builder: (context, state) {
      return const MorePage();
    },
    
  ),
];
