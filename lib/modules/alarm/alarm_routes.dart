import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarm_details_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_search_page.dart';


class AlarmRoutes extends TbRoutes {
  AlarmRoutes(super.tbContext);

  late final alarmsHandler = Handler(
    handlerFunc: (context, params) {
      final searchMode = params['search']?.firstOrNull == 'true';
      if (!searchMode) {
        return AlarmsPage(
          tbContext,
          searchMode: params['search']?.firstOrNull == 'true',
        );
      } else {
        return AlarmsSearchPage(
          tbContext: tbContext,
        );
      }
    },
  );

  late final alarmDetailsHandler = Handler(
    handlerFunc: (context, params) {
      return AlarmDetailsPage(tbContext, id: params['id']!.first);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/alarms', handler: alarmsHandler);
    router.define('/alarmDetails/:id', handler: alarmDetailsHandler);
  }
}
