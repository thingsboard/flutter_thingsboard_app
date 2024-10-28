import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/init/inti_region_app.dart';

import 'init_app.dart';

class InitRoutes extends TbRoutes {
  InitRoutes(TbContext tbContext) : super(tbContext);

  late final initHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ThingsboardInitApp(tbContext);
    },
  );

  late final regionSelectedHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ThingsboardInitRegionApp(tbContext);
    },
  );

  @override
  void doRegisterRoutes(router) {
    router.define('/', handler: initHandler);
  }
}
