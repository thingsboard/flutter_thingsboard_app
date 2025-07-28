import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/device/device_profiles_grid.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesPage extends TbPageWidget {
  DevicesPage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends TbPageState<DevicesPage> {
  final PageLinkController _pageLinkController = PageLinkController(pageSize: 10);

  @override
  Widget build(BuildContext context) {
    final deviceProfilesList = DeviceProfilesGrid(
      tbContext,
      _pageLinkController,
    );
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: Text(deviceProfilesList.title),
      ),
      body: deviceProfilesList,
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
