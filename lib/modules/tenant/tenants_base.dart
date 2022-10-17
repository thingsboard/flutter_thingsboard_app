import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../generated/l10n.dart';

mixin TenantsBase on EntitiesBase<Tenant, PageLink> {
  @override
  String get title => S.current.tenants_title;

  @override
  String get noItemsFoundText => S.current.tenants_not_found;

  @override
  Future<PageData<Tenant>> fetchEntities(PageLink pageLink) {
    return tbClient.getTenantService().getTenants(pageLink);
  }

  @override
  void onEntityTap(Tenant tenant) {
    navigateTo('/tenant/${tenant.id!.id}');
  }
}
