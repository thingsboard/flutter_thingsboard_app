import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssetDetailsPage extends EntityDetailsPage<AssetInfo> {

  AssetDetailsPage(TbContext tbContext, String assetId):
        super(tbContext,
          entityId: assetId,
          defaultTitle: 'Asset');

  @override
  Future<AssetInfo> fetchEntity(String assetId) {
    return tbClient.getAssetService().getAssetInfo(assetId);
  }

  @override
  Widget buildEntityDetails(BuildContext context, AssetInfo asset) {
    return ListTile(
      title: Text('${asset.name}'),
      subtitle: Text('${asset.type}'),
    );
  }

}
