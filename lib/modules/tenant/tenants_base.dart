import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

mixin TenantsBase on EntitiesBase<Tenant, PageLink> {
  @override
  String title(BuildContext context) => S.of(context).tenants;

  @override
  String noItemsFoundText(BuildContext context) => S.of(context).noTenantsFound;
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<PageData<Tenant>> fetchEntities(
    PageLink pageLink, {
    bool refresh = false,
  }) async {
    final r = await tbClient.getTenantControllerApi().getTenants(
      pageSize: pageLink.pageSize,
      page: pageLink.page,
      textSearch: pageLink.textSearch,
    );
    final p = r.data!;
    return toPageData(p.data, p.totalPages, p.totalElements, p.hasNext);
  }

  @override
  void onEntityTap(Tenant tenant, WidgetRef ref) {
    getIt<ThingsboardAppRouter>().navigateTo(
      '/tenants/tenant/${tenant.id!.id}',
    );
  }
}
