// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/modules/tenant/presentation/view/tenant_details_page.dart';
import 'package:thingsboard_app/modules/tenant/presentation/view/tenants_page.dart';

class TenantRoutes {
  static const tenants = '/tenants';
  static const tenant = '/tenant';
}

// Tenant management routes
final tenantRoutes = [
  GoRoute(
    path: TenantRoutes.tenants,
    builder: (context, state) {
      final searchMode = state.uri.queryParameters['search'] == 'true';

      return TenantsPage( searchMode: searchMode);
    },
    routes: [
  GoRoute(
    path: '${TenantRoutes.tenant}/:id',
    parentNavigatorKey: globalNavigatorKey,
    builder: (context, state) {
      final id = state.pathParameters['id']!;

      return TenantDetailsPage( id);
    },
  ),
    ]
  ),
  

];
