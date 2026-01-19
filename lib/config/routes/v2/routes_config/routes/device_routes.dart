import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/modules/device/device_details_page.dart';
import 'package:thingsboard_app/modules/device/devices_list_page.dart';
import 'package:thingsboard_app/modules/device/devices_main_page.dart';
import 'package:thingsboard_app/modules/device/devices_page.dart';

class DeviceRoutes {
  static const devices = '/devices';
  static const devicesPage = '/devicesPage';
  static const deviceList = '/deviceList';
  static const device = '/device';
}

// Device management routes
final deviceRoutes = [
  GoRoute(
    path: DeviceRoutes.devices,
    builder: (context, state) {
      return const DevicesMainPage();
    },
    routes: [
      GoRoute(
        path: DeviceRoutes.deviceList,
        parentNavigatorKey: globalNavigatorKey,
        builder: (context, state) {
          final searchMode = state.uri.queryParameters['search'] == 'true';
          final deviceType = state.uri.queryParameters['deviceType'];
          final activeStr = state.uri.queryParameters['active'];
          final bool? active = activeStr != null ? activeStr == 'true' : null;

          return DevicesListPage(
            searchMode: searchMode,
            deviceType: deviceType,
            active: active,
          );
        },
      ),
    ],
  ),
  GoRoute(
    path: DeviceRoutes.deviceList,

    builder: (context, state) {
      final searchMode = state.uri.queryParameters['search'] == 'true';
      final deviceType = state.uri.queryParameters['deviceType'];
      final activeStr = state.uri.queryParameters['active'];
      final bool? active = activeStr != null ? activeStr == 'true' : null;

      return DevicesListPage(
        searchMode: searchMode,
        deviceType: deviceType,
        active: active,
      );
    },
  ),
  GoRoute(
    path: DeviceRoutes.devicesPage,
    builder: (context, state) {
      return const DevicesPage();
    },
  ),

  GoRoute(
    path: '${DeviceRoutes.device}/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;

      return DeviceDetailsPage(id);
    },
  ),
];
