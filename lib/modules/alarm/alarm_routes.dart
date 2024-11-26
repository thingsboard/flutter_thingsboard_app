import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarm_details_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_search_page.dart';

class AlarmRoutes extends TbRoutes {
  AlarmRoutes(TbContext tbContext) : super(tbContext);

  late final alarmsHandler = Handler(
    handlerFunc: (context, params) {
      final searchMode = params['search']?.first == 'true';
      if (!searchMode) {
        return AlarmsPage(
          tbContext,
          searchMode: params['search']?.first == 'true',
        );
      } else {
        return AlarmsSearchPage(
          tbContext: tbContext,
        );
      }
    },
  );

  late final alarmDetailsHandler = Handler(
    handlerFunc: (_, params) {
      return AlarmDetailsPage(tbContext, id: params['id']![0]);
    },
  );

  @override
  void doRegisterRoutes(router) {
    router.define('/alarms', handler: alarmsHandler);
    router.define('/alarmDetails/:id', handler: alarmDetailsHandler);
  }
}
