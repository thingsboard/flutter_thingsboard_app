import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

mixin AssetsBase on EntitiesBase<AssetInfo, PageLink> {
  @override
  String title(BuildContext context) => S.of(context).assets;

  @override
  String noItemsFoundText(BuildContext context) =>
      S.of(context).noAssetsFound;
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<PageData<AssetInfo>> fetchEntities(
    PageLink pageLink, {
    bool refresh = false,
  }) async {
    if (tbClient.isTenantAdmin()) {
      final r = await tbClient.getAssetControllerApi().getTenantAssetInfos(
        pageSize: pageLink.pageSize,
        page: pageLink.page,
        textSearch: pageLink.textSearch,
      );
      final p = r.data!;
      return toPageData(p.data, p.totalPages, p.totalElements, p.hasNext);
    } else {
      final r = await tbClient.getAssetControllerApi().getCustomerAssetInfos(
        customerId: tbClient.getAuthUser()!.customerId!,
        pageSize: pageLink.pageSize,
        page: pageLink.page,
        textSearch: pageLink.textSearch,
      );
      final p = r.data!;
      return toPageData(p.data, p.totalPages, p.totalElements, p.hasNext);
    }
  }

  @override
  void onEntityTap(AssetInfo asset, WidgetRef ref) {
    if (asset.id?.id != null) {
      getIt<ThingsboardAppRouter>().navigateTo('/asset/${asset.id!.id}');
    }
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
    return Text(asset.name ?? '');
  }

  Widget _buildCard(BuildContext context, AssetInfo asset) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              asset.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF282828),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 20 / 14,
                              ),
                            ),
                          ),
                          Text(
                            entityDateFormat.format(
                              DateTime.fromMillisecondsSinceEpoch(
                                asset.createdTime!,
                              ),
                            ),
                            style: const TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              height: 16 / 12,
                            ),
                          ),
                        ],
                      ),
                      if (asset.label?.isNotEmpty == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            asset.label!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              height: 16 / 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        asset.type ?? '',
                        style: const TextStyle(
                          color: Color(0xFFAFAFAF),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListWidgetCard(BuildContext context, AssetInfo asset) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        asset.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF282828),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.7,
                        ),
                      ),
                      if (asset.label?.isNotEmpty == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            asset.label!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              height: 16 / 12,
                            ),
                          ),
                        ),
                      Text(
                        asset.type ?? '',
                        style: const TextStyle(
                          color: Color(0xFFAFAFAF),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
