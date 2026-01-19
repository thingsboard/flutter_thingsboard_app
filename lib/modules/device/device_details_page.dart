import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class DeviceDetailsPage extends EntityDetailsPage<DeviceInfo> {
  DeviceDetailsPage(String deviceId, {super.key})
    : super(entityId: deviceId, defaultTitle: 'Device');
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<DeviceInfo?> fetchEntity(String id) {
    return tbClient.getDeviceService().getDeviceInfo(id);
  }

  @override
  Widget buildEntityDetails(BuildContext context, DeviceInfo entity) {
    return ListTile(title: Text(entity.name), subtitle: Text(entity.type));
  }
}
