import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_page.dart';

class AlarmRoutes extends TbRoutes {
  late var alarmsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final searchMode = params['search']?.first == 'true';
      return AlarmsPage(tbContext, searchMode: searchMode);
    },
  );

  AlarmRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define('/alarms', handler: alarmsHandler);
  }
}
