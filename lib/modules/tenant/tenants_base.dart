import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin TenantsBase on EntitiesBase<Tenant, PageLink> {
  @override
  String get title => 'Tenants';

  @override
  String get noItemsFoundText => 'No tenants found';

  @override
  Future<PageData<Tenant>> fetchEntities(PageLink pageLink) {
    return tbClient.getTenantService().getTenants(pageLink);
  }

  @override
  void onEntityTap(Tenant tenant) {
    navigateTo('/tenant/${tenant.id!.id}');
  }
}
