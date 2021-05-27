import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/utils/services/device_profile_cache.dart';
import 'package:thingsboard_app/utils/services/entity_query_api.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin DevicesBase on EntitiesBase<EntityData, EntityDataQuery> {

  @override
  String get title => 'Devices';

  @override
  String get noItemsFoundText => 'No devices found';

  @override
  Future<PageData<EntityData>> fetchEntities(EntityDataQuery dataQuery) {
    return tbClient.getEntityQueryService().findEntityDataByQuery(dataQuery);
  }

  @override
  void onEntityTap(EntityData device) async {
    var profile = await DeviceProfileCache.getDeviceProfileInfo(tbClient, device.field('type')!, device.entityId.id!);
    if (profile.defaultDashboardId != null) {
      var dashboardId = profile.defaultDashboardId!.id!;
      var state = Utils.createDashboardEntityState(device.entityId, entityName: device.field('name')!, entityLabel: device.field('label')!);
      navigateTo('/dashboard/$dashboardId?title=${device.field('name')!}&state=$state');
    } else {
      // navigateTo('/device/${device.entityId.id}');
      if (tbClient.isTenantAdmin()) {
        showWarnNotification('BALALAI');
      }
    }
  }

  @override
  Widget buildEntityListCard(BuildContext context, EntityData device) {
    return _buildEntityListCard(context, device, false);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, EntityData device) {
    return _buildEntityListCard(context, device, true);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, EntityData device) {
    return Text(device.field('name')!);
  }

  bool displayCardImage(bool listWidgetCard) => listWidgetCard;

  Widget _buildEntityListCard(BuildContext context, EntityData device, bool listWidgetCard) {
    return DeviceCard(tbContext, device: device, listWidgetCard: listWidgetCard, displayImage: displayCardImage(listWidgetCard));
  }
}

class DeviceQueryController extends PageKeyController<EntityDataQuery> {

  DeviceQueryController({int pageSize = 20, String? searchText, String? deviceType, bool? active}):
        super(EntityQueryApi.createDefaultDeviceQuery(pageSize: pageSize, searchText: searchText, deviceType: deviceType, active: active));

  @override
  EntityDataQuery nextPageKey(EntityDataQuery deviceQuery) => deviceQuery.next();

  onSearchText(String searchText) {
    value.pageKey.pageLink.page = 0;
    value.pageKey.pageLink.textSearch = searchText;
    notifyListeners();
  }

}

class DeviceCard extends TbContextWidget<DeviceCard, _DeviceCardState> {

  final EntityData device;
  final bool listWidgetCard;
  final bool displayImage;

  DeviceCard(TbContext tbContext, {required this.device, this.listWidgetCard = false, this.displayImage = false}) : super(tbContext);

  @override
  _DeviceCardState createState() => _DeviceCardState();

}

class _DeviceCardState extends TbContextState<DeviceCard, _DeviceCardState> {

  final entityDateFormat = DateFormat('yyyy-MM-dd');

  late Future<DeviceProfileInfo> deviceProfileFuture;

  @override
  void initState() {
    super.initState();
    if (widget.displayImage) {
      deviceProfileFuture = DeviceProfileCache.getDeviceProfileInfo(
          tbClient, widget.device.field('type')!, widget.device.entityId.id!);
    }
  }

  @override
  void didUpdateWidget(DeviceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.displayImage) {
      var oldDevice = oldWidget.device;
      var device = widget.device;
      if (oldDevice.field('type')! != device.field('type')!) {
        deviceProfileFuture = DeviceProfileCache.getDeviceProfileInfo(
            tbClient, widget.device.field('type')!, widget.device.entityId.id!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: widget.listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (widget.displayImage) Container(
            width: widget.listWidgetCard ? 58 : 60,
            height: widget.listWidgetCard ? 58 : 60,
            decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(widget.listWidgetCard ? 4 : 6))
            ),
            child: FutureBuilder<DeviceProfileInfo>(
              future: deviceProfileFuture,
              builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                    var profile = snapshot.data!;
                    if (profile.image != null) {
                      var uriData = UriData.parse(profile.image!);
                      return ClipRRect(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(widget.listWidgetCard ? 4 : 6)),
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.memory(uriData.contentAsBytes()),
                                )
                            ),
                            Positioned.fill(
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0x00000000),
                                            Color(0xb7000000)
                                          ],
                                          stops: [0.4219, 1]
                                      )
                                  )
                              ),
                            )
                          ],
                        )
                      );
                    } else {
                      return Center(
                          child: Icon(Icons.devices_other, color: Color(0xFFC2C2C2))
                      );
                    }
                  } else {
                    return Center(child: RefreshProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Theme.of(tbContext.currentState!.context).colorScheme.primary)
                    ));
                  }
              },
            ),
          ),
          Flexible(
              fit: widget.listWidgetCard ? FlexFit.loose : FlexFit.tight,
              child:
              Container(
                  padding: EdgeInsets.symmetric(vertical: widget.listWidgetCard ? 9 : 10, horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                          mainAxisSize: widget.listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.centerLeft,
                                child: Text('${widget.device.field('name')!}',
                                    style: TextStyle(
                                        color: Color(0xFF282828),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 20 / 14
                                    ))
                            ),
                            if (!widget.listWidgetCard) Text(widget.device.attribute('active') == 'true' ? 'Active' : 'Inactive',
                                style: TextStyle(
                                  color: widget.device.attribute('active') == 'true' ? Color(0xFF008A00) : Color(0xFFAFAFAF),
                                  fontSize: 12,
                                  height: 12 /12,
                                  fontWeight: FontWeight.w500,
                                ))
                          ]
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisSize: widget.listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.device.field('type')!}',
                              style: TextStyle(
                                  color: Color(0xFFAFAFAF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 16 / 12
                              )),
                          if (!widget.listWidgetCard) Text(entityDateFormat.format(DateTime.fromMillisecondsSinceEpoch(widget.device.createdTime!)),
                              style: TextStyle(
                                  color: Color(0xFFAFAFAF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 16 / 12
                              ))
                        ],
                      )
                    ],
                  )
              )
          )
        ]
    );
  }

}
