import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

import 'profile_page.dart';

class ProfileRoutes extends TbRoutes {
  late var profileHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var fullscreen = params['fullscreen']?.first == 'true';
    return ProfilePage(tbContext, fullscreen: fullscreen);
  });

  ProfileRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/profile", handler: profileHandler);
  }
}
