import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

mixin AssetsBase on EntitiesBase<Asset, PageLink> {
  @override
  String title(BuildContext context) => S.of(context).assets;

  @override
  String noItemsFoundText(BuildContext context) => S.of(context).noAssetsFound;
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<PageData<Asset>> fetchEntities(
    PageLink pageLink, {
    bool refresh = false,
  }) async {
    // `/api/user/assets` honours RBAC for every authority; `/api/assets` is
    // tenant-only and requires generic ASSET read, so a tenant admin with
    // group-scoped roles would get a 403 there.
    final r = await tbClient.getAssetControllerApi().getUserAssets(
      pageSize: pageLink.pageSize.toString(),
      page: pageLink.page.toString(),
      textSearch: pageLink.textSearch,
    );
    final p = r.data!;
    return toPageData(p.data, p.totalPages, p.totalElements, p.hasNext);
  }

  @override
  void onEntityTap(Asset asset, WidgetRef ref) {
    if (asset.id?.id != null) {
      getIt<ThingsboardAppRouter>().navigateTo('/asset/${asset.id!.id}');
    }
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
    return Text(customTranslationService.translate(asset.name));
  }

  Widget _buildCard(BuildContext context, Asset asset) {
    final name = customTranslationService.translate(asset.name);
    final label = customTranslationService.translate(asset.label);
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
                              name,
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
                      if (label.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            label,
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

  Widget _buildListWidgetCard(BuildContext context, Asset asset) {
    final name = customTranslationService.translate(asset.name);
    final label = customTranslationService.translate(asset.label);
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
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF282828),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.7,
                        ),
                      ),
                      if (label.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            label,
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
