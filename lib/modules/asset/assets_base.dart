import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin AssetsBase on EntitiesBase<AssetInfo, PageLink> {

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
  void onEntityTap(AssetInfo asset) {
    navigateTo('/asset/${asset.id!.id}');
  }

  @override
  Widget buildEntityListCard(BuildContext context, AssetInfo asset) {
    return _buildEntityListCard(context, asset, false);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, AssetInfo asset) {
    return _buildEntityListCard(context, asset, true);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, AssetInfo asset) {
    return Text(asset.name);
  }


  Widget _buildEntityListCard(BuildContext context, AssetInfo asset, bool listWidgetCard) {
    return Row(
        mainAxisSize: listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Flexible(
              fit: listWidgetCard ? FlexFit.loose : FlexFit.tight,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: listWidgetCard ? 9 : 10, horizontal: 16),
                child: Row(
                  mainAxisSize: listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    Flexible(
                        fit: listWidgetCard ? FlexFit.loose : FlexFit.tight,
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
                    (!listWidgetCard ? Column(
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
}
