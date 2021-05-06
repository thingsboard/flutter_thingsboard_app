import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin AssetsBase on EntitiesBase<AssetInfo> {

  @override
  String get title => 'Assets';

  @override
  String get noItemsFoundText => 'No assets found';

  @override
  Future<PageData<AssetInfo>> fetchEntities(PageLink pageLink) {
    if (tbClient.isTenantAdmin()) {
      return tbClient.getAssetService().getTenantAssetInfos(pageLink);
    } else {
      return tbClient.getAssetService().getCustomerAssetInfos(tbClient.getAuthUser()!.customerId, pageLink);
    }
  }

  @override
  Widget buildEntityCard(BuildContext context, AssetInfo asset, bool briefView) {
    return Row(
        mainAxisSize: briefView ? MainAxisSize.min : MainAxisSize.max,
        children: [
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
                                child: Text('${asset.name}',
                                    style: TextStyle(
                                        color: Color(0xFF282828),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.7
                                    ))
                            ),
                            Text('${asset.type}',
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
                        Text(entityDateFormat.format(DateTime.fromMillisecondsSinceEpoch(asset.createdTime!)),
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

  @override
  void onEntityDetails(AssetInfo asset) {
    navigateTo('/asset/${asset.id!.id}');
  }

}
