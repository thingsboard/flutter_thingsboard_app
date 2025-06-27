import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';

import 'package:thingsboard_app/modules/tenant/tenant_details_page.dart';
import 'package:thingsboard_app/modules/tenant/tenants_page.dart';

class TenantRoutes extends TbRoutes {
  TenantRoutes(super.tbContext);
  late Handler tenantsHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      final searchMode = params['search']?.first == 'true';
      return TenantsPage(tbContext, searchMode: searchMode);
    },
  );

  late Handler tenantDetailsHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return TenantDetailsPage(tbContext, params['id']!.first);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/tenants', handler: tenantsHandler);
    router.define('/tenant/:id', handler: tenantDetailsHandler);
  }
}
