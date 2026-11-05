// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/profile/change_password_page.dart';
import 'package:thingsboard_app/modules/profile/profile_page.dart';
import 'package:thingsboard_app/modules/profile/widget/profile_edit_page.dart';

class ProfileRoutes {
  static const profile = '/profile';
  static const changePassword = '/changePassword';
  static const editeProfile =  '/edit';
}

// Profile routes
final List<GoRoute> profileRoutes = [
  GoRoute(
    path: ProfileRoutes.profile,
    builder: (context, state) {
      final fullscreen = state.uri.queryParameters['fullscreen'] == 'true';
      return ProfilePage(fullscreen: fullscreen);
    },
    routes: [
        GoRoute(path: ProfileRoutes.changePassword,
       builder: (context, state) => const ChangePasswordPage(),),
      GoRoute(path: ProfileRoutes.editeProfile,
       builder: (context, state) => const ProfileEditPage(),)
    ]
  ),
];
