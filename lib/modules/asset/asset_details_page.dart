import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class AssetDetailsPage extends EntityDetailsPage<Asset> {
  AssetDetailsPage(TbContext tbContext, String assetId)
      : super(tbContext,
            entityId: assetId,
            defaultTitle: 'Asset',
            subTitle: 'Asset details');

  @override
  Future<Asset?> fetchEntity(String assetId) {
    return tbClient.getAssetService().getAsset(assetId);
  }

  @override
  Widget buildEntityDetails(BuildContext context, Asset asset) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${S.of(context).assetName}', style: labelTextStyle),
              Text(asset.name, style: valueTextStyle),
              SizedBox(height: 16),
              Text('${S.of(context).type}', style: labelTextStyle),
              Text(asset.type, style: valueTextStyle),
              SizedBox(height: 16),
              Text('${S.of(context).label}', style: labelTextStyle),
              Text(asset.label ?? '', style: valueTextStyle),
            ]));
  }
}
