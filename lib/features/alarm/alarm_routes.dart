import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/routes/i_tb_routes.dart';
import 'package:thingsboard_app/features/alarm/presentation/view/alarm_details_page.dart';
import 'package:thingsboard_app/features/alarm/presentation/view/alarms_page.dart';
import 'package:thingsboard_app/features/alarm/presentation/view/alarms_search_page.dart';

class AlarmRoutes implements ITbRoutes {
  late final alarmsHandler = Handler(
    handlerFunc: (context, params) {
      final searchMode = params['search']?.first == 'true';
      if (!searchMode) {
        return AlarmsPage(
          searchMode: params['search']?.first == 'true',
        );
      } else {
        return const AlarmsSearchPage();
      }
    },
  );

  late final alarmDetailsHandler = Handler(
    handlerFunc: (_, params) {
      return AlarmDetailsPage(id: params['id']![0]);
    },
  );

  @override
  void registerRoutes(FluroRouter router) {
    router.define('/alarms', handler: alarmsHandler);
    router.define('/alarmDetails/:id', handler: alarmDetailsHandler);
  }
}
