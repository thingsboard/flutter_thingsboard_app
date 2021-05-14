import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/devices_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesPage extends TbContextWidget<DevicesPage, _DevicesPageState> {

  DevicesPage(TbContext tbContext) : super(tbContext);

  @override
  _DevicesPageState createState() => _DevicesPageState();

}

class _DevicesPageState extends TbContextState<DevicesPage, _DevicesPageState> {

  @override
  Widget build(BuildContext context) {
    var devicesList = DevicesList(tbContext);
    return Scaffold(
        appBar: TbAppBar(
            tbContext,
            title: Text(devicesList.title)
        ),
        body: devicesList
    );
  }

}
