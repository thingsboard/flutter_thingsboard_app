import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class DeviceDetailsPage extends EntityDetailsPage<DeviceInfo> {
  DeviceDetailsPage(super.tbContext, String deviceId, {super.key})
      : super(entityId: deviceId, defaultTitle: 'Device');

  @override
  Future<DeviceInfo?> fetchEntity(String id) {
    return tbClient.getDeviceService().getDeviceInfo(id);
  }

  @override
  Widget buildEntityDetails(BuildContext context, DeviceInfo entity) {
    return ListTile(
      title: Text(entity.name),
      subtitle: Text(entity.type),
    );
  }
}
