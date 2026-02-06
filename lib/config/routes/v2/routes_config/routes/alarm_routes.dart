import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarm_details_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_page.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_search_page.dart';

class AlarmRoutes {
  static const alarms = '/alarms';
  static const alarmDetails = '/alarmDetails';
}

// Alarm management routes
final alarmRoutes = [
  GoRoute(
    path: AlarmRoutes.alarms,
    builder: (context, state) {
      final searchMode = state.uri.queryParameters['search'] == 'true';
      if (!searchMode) {
        return AlarmsPage(
          searchMode: searchMode,
        );
      } else {
        return const AlarmsSearchPage();
      }
    },
    routes: [
 GoRoute(
    path: '${AlarmRoutes.alarmDetails}/:id',
   parentNavigatorKey: globalNavigatorKey,
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return AlarmDetailsPage( id: id);
    },
  ),
    ]
  ),
  
 
];
