import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class AssetDetailsPage extends EntityDetailsPage<Asset> {
  AssetDetailsPage(String assetId, {super.key})
    : super(
        entityId: assetId,
        defaultTitle: 'Asset',
        subTitle: 'Asset details',
      );
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<Asset?> fetchEntity(String id) async {
    final r = await tbClient.getAssetControllerApi().getAssetById(assetId: id);
    return r.data;
  }

  @override
  Widget buildEntityDetails(BuildContext context, Asset entity) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).assetName, style: labelTextStyle),
          Text(
            getIt<ICustomTranslationService>().translate(entity.name),
            style: valueTextStyle,
          ),
          const SizedBox(height: 16),
          Text(S.of(context).type, style: labelTextStyle),
          Text(entity.type ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text(S.of(context).label, style: labelTextStyle),
          Text(
            getIt<ICustomTranslationService>().translate(entity.label),
            style: valueTextStyle,
          ),
        ],
      ),
    );
  }
}
