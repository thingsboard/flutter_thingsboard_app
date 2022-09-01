import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/device/devices_page.dart';
import 'package:thingsboard_app/modules/main/main_page.dart';

import 'device_details_page.dart';
import 'devices_list_page.dart';

class DeviceRoutes extends TbRoutes {
  late var devicesHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MainPage(tbContext, path: '/devices');
  });

  late var devicesPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DevicesPage(tbContext);
  });

  late var deviceListHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var searchMode = params['search']?.first == 'true';
    var deviceType = params['deviceType']?.first;
    String? activeStr = params['active']?.first;
    bool? active = activeStr != null ? activeStr == 'true' : null;
    return DevicesListPage(tbContext,
        searchMode: searchMode, deviceType: deviceType, active: active);
  });

  late var deviceDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DeviceDetailsPage(tbContext, params["id"][0]);
  });

  DeviceRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/devices", handler: devicesHandler);
    router.define("/devicesPage", handler: devicesPageHandler);
    router.define("/deviceList", handler: deviceListHandler);
    router.define("/device/:id", handler: deviceDetailsHandler);
  }
}
