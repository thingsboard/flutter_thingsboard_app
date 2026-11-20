// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/core/auth/login/view/login_page.dart';

final rootRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(riderectUrl: null),
    //const Scaffold(body: Center(child: TbProgressIndicator(size: 50,))),
  ),
];
