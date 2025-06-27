import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';

import 'package:thingsboard_app/modules/profile/profile_page.dart';

class ProfileRoutes extends TbRoutes {
  ProfileRoutes(super.tbContext);
  late final profileHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      final fullscreen = params['fullscreen']?.first == 'true';
      return ProfilePage(tbContext, fullscreen: fullscreen);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/profile', handler: profileHandler);
  }
}
