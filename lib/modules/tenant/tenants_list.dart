import 'package:flutter/src/foundation/key.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'tenants_base.dart';

class TenantsList extends BaseEntitiesWidget<Tenant, PageLink>
    with TenantsBase, ContactBasedBase, EntitiesListStateBase {
  TenantsList(
      TbContext tbContext, PageKeyController<PageLink> pageKeyController,
      {Key? key, searchMode = false})
      : super(tbContext, pageKeyController, key: key, searchMode: searchMode);
}
