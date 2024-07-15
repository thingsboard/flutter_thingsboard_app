import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class DeviceDetailsPage extends EntityDetailsPage<DeviceInfo> {
  DeviceDetailsPage(TbContext tbContext, String deviceId, {super.key})
      : super(tbContext, entityId: deviceId, defaultTitle: 'Device');

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
