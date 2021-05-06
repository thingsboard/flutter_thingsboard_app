import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin DevicesBase on EntitiesBase<DeviceInfo> {

  @override
  String get title => 'Devices';

  @override
  String get noItemsFoundText => 'No devices found';

  @override
  Future<PageData<DeviceInfo>> fetchEntities(PageLink pageLink) {
    if (tbClient.isTenantAdmin()) {
      return tbClient.getDeviceService().getTenantDeviceInfos(pageLink);
    } else {
      return tbClient.getDeviceService().getCustomerDeviceInfos(tbClient.getAuthUser()!.customerId, pageLink);
    }
  }

  @override
  void onEntityDetails(DeviceInfo device) {
    navigateTo('/device/${device.id!.id}');
  }

  @override
  Widget buildEntityCard(BuildContext context, DeviceInfo device, bool briefView) {
    return Row(
        mainAxisSize: briefView ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Container(
            width: briefView ? 58 : 60,
            decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(briefView ? 4 : 6))
            ),
            child: Center(
                child: Icon(Icons.devices_other, color: Color(0xFFC2C2C2))
            ),
          ),
          Flexible(
              fit: briefView ? FlexFit.loose : FlexFit.tight,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: briefView ? 9 : 10, horizontal: 16),
                child: Row(
                  mainAxisSize: briefView ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    Flexible(
                        fit: briefView ? FlexFit.loose : FlexFit.tight,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.centerLeft,
                                child: Text('${device.name}',
                                    style: TextStyle(
                                        color: Color(0xFF282828),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.7
                                    ))
                            ),
                            Text('${device.type}',
                                style: TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    height: 1.33
                                ))
                          ],
                        )
                    ),
                    (!briefView ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(entityDateFormat.format(DateTime.fromMillisecondsSinceEpoch(device.createdTime!)),
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33
                            ))
                      ],
                    ) : Container())
                  ],
                ),
              )

          )
        ]
    );
  }
}
