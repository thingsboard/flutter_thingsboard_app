import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class DeviceDetailsPage extends EntityDetailsPage<Device> {

  DeviceDetailsPage(TbContext tbContext, String deviceId):
        super(tbContext,
              entityId: deviceId,
              defaultTitle: 'Device');

  @override
  Future<Device?> fetchEntity(String deviceId) {
    return tbClient.getDeviceService().getDevice(deviceId);
  }

  @override
  Widget buildEntityDetails(BuildContext context, Device device) {
    return ListTile(
      title: Text('${device.name}'),
      subtitle: Text('${device.type}'),
    );
  }

}
