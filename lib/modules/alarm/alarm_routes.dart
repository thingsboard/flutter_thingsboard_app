import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/alarms_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_filter_page.dart';
import 'package:thingsboard_app/modules/main/main_page.dart';

class AlarmRoutes extends TbRoutes {
  late var alarmsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final searchMode = params['search']?.first == 'true';
      final filterMode = params['filter']?.first == 'true';
      if (searchMode) {
        return AlarmsPage(tbContext, searchMode: searchMode);
      } else if (filterMode) {
        return AlarmsFilterPage(tbContext);
      } else {
        return MainPage(tbContext, path: '/alarms');
      }
    },
  );

  AlarmRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define('/alarms', handler: alarmsHandler);
  }
}
