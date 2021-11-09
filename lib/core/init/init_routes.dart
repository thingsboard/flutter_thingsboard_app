import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

import 'init_app.dart';

class InitRoutes extends TbRoutes {
  late var initHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ThingsboardInitApp(tbContext);
  });

  InitRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/", handler: initHandler);
  }
}
