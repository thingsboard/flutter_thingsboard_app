import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AssetDetailsPage extends EntityDetailsPage<AssetInfo> {
  AssetDetailsPage(super.tbContext, String assetId, {super.key})
      : super(
          entityId: assetId,
          defaultTitle: 'Asset',
          subTitle: 'Asset details',
        );

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
        children: [
          Text(S.of(context).assetName, style: labelTextStyle),
          Text(entity.name, style: valueTextStyle),
          const SizedBox(height: 16),
          Text(S.of(context).type, style: labelTextStyle),
          Text(entity.type, style: valueTextStyle),
          const SizedBox(height: 16),
          Text(S.of(context).label, style: labelTextStyle),
          Text(entity.label ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text(
            S.of(context).assignedToCustomer,
            style: labelTextStyle,
          ),
          Text(entity.customerTitle ?? '', style: valueTextStyle),
        ],
      ),
    );
  }
}
