import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'tenant_details_page.dart';
import 'tenants_page.dart';

class TenantRoutes extends TbRoutes {
  late var tenantsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var searchMode = params['search']?.first == 'true';
    return TenantsPage(tbContext, searchMode: searchMode);
  });

  late var tenantDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TenantDetailsPage(tbContext, params["id"][0]);
  });

  TenantRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/tenants", handler: tenantsHandler);
    router.define("/tenant/:id", handler: tenantDetailsHandler);
  }
}
