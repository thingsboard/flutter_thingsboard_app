import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/device/device_profiles_grid.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesMainPage extends TbContextWidget {
  DevicesMainPage(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _DevicesMainPageState();
}

class _DevicesMainPageState extends TbContextState<DevicesMainPage>
    with AutomaticKeepAliveClientMixin<DevicesMainPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
