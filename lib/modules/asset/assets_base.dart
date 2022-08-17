import 'package:flutter/material.dart';
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
      return tbClient
          .getAssetService()
          .getCustomerAssetInfos(tbClient.getAuthUser()!.customerId!, pageLink);
    }
  }

  @override
  void onEntityTap(AssetInfo asset) {
    navigateTo('/asset/${asset.id!.id}');
  }

  @override
  Widget buildEntityListCard(BuildContext context, AssetInfo asset) {
    return _buildCard(context, asset);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, AssetInfo asset) {
    return _buildListWidgetCard(context, asset);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, AssetInfo asset) {
    return Text(asset.name);
  }

  Widget _buildCard(context, AssetInfo asset) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Flexible(
          fit: FlexFit.tight,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 16),
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.centerLeft,
                                  child: Text('${asset.name}',
                                      style: TextStyle(
                                          color: Color(0xFF282828),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 20 / 14))),
                              Text(
                                  entityDateFormat.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          asset.createdTime!)),
                                  style: TextStyle(
                                      color: Color(0xFFAFAFAF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      height: 16 / 12))
                            ]),
                        SizedBox(height: 4),
                        Text('${asset.type}',
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33))
                      ],
                    )),
                SizedBox(width: 16),
                Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
                SizedBox(width: 16)
              ],
            ),
          ))
    ]);
  }

  Widget _buildListWidgetCard(BuildContext context, AssetInfo asset) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
          fit: FlexFit.loose,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: Column(
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
                                    height: 1.7))),
                        Text('${asset.type}',
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33))
                      ],
                    ))
              ])))
    ]);
  }
}
