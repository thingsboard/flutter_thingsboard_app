import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/devices_base.dart';
import 'package:thingsboard_app/modules/device/devices_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesPage extends TbPageWidget<DevicesPage, _DevicesPageState> {

  final String? deviceType;
  final bool? active;
  final bool searchMode;

  DevicesPage(TbContext tbContext, {this.deviceType, this.active, this.searchMode = false}) : super(tbContext);

  @override
  _DevicesPageState createState() => _DevicesPageState();

}

class _DevicesPageState extends TbPageState<DevicesPage, _DevicesPageState> {

  late final DeviceQueryController _deviceQueryController;

  @override
  void initState() {
    super.initState();
    _deviceQueryController = DeviceQueryController(deviceType: widget.deviceType, active: widget.active);
  }

  @override
  Widget build(BuildContext context) {
    var devicesList = DevicesList(tbContext, _deviceQueryController, searchMode: widget.searchMode, displayDeviceImage: widget.deviceType == null);
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) => _deviceQueryController.onSearchText(searchText),
      );
    } else {
      String titleText = widget.deviceType != null ? widget.deviceType! : 'All devices';
      String? subTitleText;
      if (widget.active != null) {
        subTitleText = widget.active == true ? 'Active' : 'Inactive';
      }
      Column title = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: subTitleText != null ? 16 : 20,
            height: subTitleText != null ? 20 / 16 : 24 / 20
          )),
          if (subTitleText != null)
            Text(subTitleText, style: TextStyle(
              color: Color(0x61FFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.normal,
              height: 16 / 12
            ))
        ]
      );

      appBar = TbAppBar(
          tbContext,
          title: title,
          actions: [
            IconButton(
              icon: Icon(
                  Icons.search
              ),
              onPressed: () {
                List<String> params = [];
                params.add('search=true');
                if (widget.deviceType != null) {
                  params.add('deviceType=${widget.deviceType}');
                }
                if (widget.active != null) {
                  params.add('active=${widget.active}');
                }
                navigateTo('/deviceList?${params.join('&')}');
              },
            )
          ]);
    }
    return Scaffold(
        appBar: appBar,
        body: devicesList
    );
  }

  @override
  void dispose() {
    _deviceQueryController.dispose();
    super.dispose();
  }

}
