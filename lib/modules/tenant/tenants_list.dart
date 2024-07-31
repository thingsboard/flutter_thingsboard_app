import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

import 'tenants_base.dart';

class TenantsList extends BaseEntitiesWidget<Tenant, PageLink>
    with TenantsBase, ContactBasedBase, EntitiesListStateBase {
  TenantsList(
    TbContext tbContext,
    PageKeyController<PageLink> pageKeyController, {
    searchMode = false,
    super.key,
  }) : super(tbContext, pageKeyController, searchMode: searchMode);
}
