import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/device/device_details_page.dart';
import 'package:thingsboard_app/modules/device/devices_list_page.dart';
import 'package:thingsboard_app/modules/device/devices_main_page.dart';
import 'package:thingsboard_app/modules/device/devices_page.dart';

class DeviceRoutes extends TbRoutes {
  DeviceRoutes(super.tbContext);
  late final devicesHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return DevicesMainPage(tbContext);
    },
  );

  late final devicesPageHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return DevicesPage(tbContext);
    },
  );

  late final deviceListHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      final searchMode = params['search']?.first == 'true';
      final deviceType = params['deviceType']?.first;
      final String? activeStr = params['active']?.first;
      final bool? active = activeStr != null ? activeStr == 'true' : null;
      return DevicesListPage(
        tbContext,
        searchMode: searchMode,
        deviceType: deviceType,
        active: active,
      );
    },
  );

  late final deviceDetailsHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return DeviceDetailsPage(tbContext, params['id']!.first);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/devices', handler: devicesHandler);
    router.define('/devicesPage', handler: devicesPageHandler);
    router.define('/deviceList', handler: deviceListHandler);
    router.define('/device/:id', handler: deviceDetailsHandler);
  }
}
