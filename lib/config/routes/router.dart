import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/auth/login/login_page.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/init/init_app.dart';
import 'package:thingsboard_app/modules/device/devices_page.dart';
import 'package:thingsboard_app/modules/home/home_page.dart';
import 'package:thingsboard_app/modules/profile/profile_page.dart';

class ThingsboardAppRouter {
  final router = FluroRouter();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  late final _tbContext = TbContext(router, routeObserver);

  late var initHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ThingsboardInitApp(tbContext);
  });

  late var loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginPage(_tbContext);
  });

  late var homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomePage(_tbContext);
  });

  late var profileHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ProfilePage(_tbContext);
  });

  late var devicesHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DevicesPage(_tbContext);
  });

  ThingsboardAppRouter() {
    router.define("/", handler: initHandler);
    router.define("/login", handler: loginHandler);
    router.define("/home", handler: homeHandler);
    router.define("/profile", handler: profileHandler);
    router.define("/devices", handler: devicesHandler);
  }

  TbContext get tbContext => _tbContext;
}
