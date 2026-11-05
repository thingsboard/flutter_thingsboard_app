// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/home/presentation/view/home_page.dart';

class HomeRoutes {
  static const home = '/home';
}

// Root and home routes
final homeRoutes = [

      GoRoute(path: HomeRoutes.home,
 
       builder: (context, state) => const HomePage()),
 
];
