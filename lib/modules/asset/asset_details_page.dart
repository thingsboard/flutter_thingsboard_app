import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssetDetailsPage extends EntityDetailsPage<AssetInfo> {
  AssetDetailsPage(TbContext tbContext, String assetId, {Key? key})
      : super(tbContext,
            key: key,
            entityId: assetId,
            defaultTitle: 'Asset',
            subTitle: 'Asset details');

  @override
  Future<AssetInfo?> fetchEntity(String id) {
    return tbClient.getAssetService().getAssetInfo(id);
  }

  @override
  Widget buildEntityDetails(BuildContext context, AssetInfo entity) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Asset name', style: labelTextStyle),
              Text(entity.name, style: valueTextStyle),
              const SizedBox(height: 16),
              Text('Type', style: labelTextStyle),
              Text(entity.type, style: valueTextStyle),
              const SizedBox(height: 16),
              Text('Label', style: labelTextStyle),
              Text(entity.label ?? '', style: valueTextStyle),
              const SizedBox(height: 16),
              Text('Assigned to customer', style: labelTextStyle),
              Text(entity.customerTitle ?? '', style: valueTextStyle),
            ]));
  }
}
