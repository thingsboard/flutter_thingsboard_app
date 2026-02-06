import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/device/device_profiles_grid.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesMainPage extends StatefulWidget {
  const DevicesMainPage( {super.key});

  @override
  State<StatefulWidget> createState() => _DevicesMainPageState();
}

class _DevicesMainPageState extends State<DevicesMainPage>
    with AutomaticKeepAliveClientMixin<DevicesMainPage> {
  final PageLinkController _pageLinkController = PageLinkController(
    pageSize: 10,
  );

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final deviceProfilesList = DeviceProfilesGrid(
  
      _pageLinkController,
    );

    return Scaffold(
      appBar: TbAppBar(title: Text(deviceProfilesList.title),),
      body: deviceProfilesList,
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
