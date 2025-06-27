import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/core/init/init_app.dart';
import 'package:thingsboard_app/core/init/inti_region_app.dart';

class InitRoutes extends TbRoutes {
  InitRoutes(super.tbContext);

  late final initHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return ThingsboardInitApp(tbContext);
    },
  );

  late final regionSelectedHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return ThingsboardInitRegionApp(tbContext);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/', handler: initHandler);
  }
}
