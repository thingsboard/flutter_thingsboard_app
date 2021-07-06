import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

mixin AssetsBase on EntitiesBase<Asset, PageLink> {

  @override
  String get title => 'Assets';

  @override
  String get noItemsFoundText => 'No assets found';

  @override
  Future<PageData<Asset>> fetchEntities(PageLink pageLink) {
    return tbClient.getAssetService().getUserAssets(pageLink);
  }

  @override
  void onEntityTap(Asset asset) {
    navigateTo('/asset/${asset.id!.id}');
  }

  @override
  Widget buildEntityListCard(BuildContext context, Asset asset) {
    return _buildCard(context, asset);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, Asset asset) {
    return _buildListWidgetCard(context, asset);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, Asset asset) {
    return Text(asset.name);
  }

  Widget _buildCard(context, Asset asset) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: 16),
                    Flexible(
                        fit: FlexFit.tight,
                        child:
                        Column(
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
                                              height: 20 / 14
                                          ))
                                  ),
                                  Text(entityDateFormat.format(DateTime.fromMillisecondsSinceEpoch(asset.createdTime!)),
                                      style: TextStyle(
                                          color: Color(0xFFAFAFAF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          height: 16 / 12
                                      ))
                                ]
                            ),
                            SizedBox(height: 4),
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
                    SizedBox(width: 16),
                    Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
                    SizedBox(width: 16)
                  ],
                ),
              )

          )
        ]
    );
  }

  Widget _buildListWidgetCard(BuildContext context, Asset asset) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              fit: FlexFit.loose,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
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
                    )
                  ]
                )
              )
          )
        ]
    );
  }
}
