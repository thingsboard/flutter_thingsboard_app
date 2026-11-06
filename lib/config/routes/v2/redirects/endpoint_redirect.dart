// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/redirects/redirect.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/select_region_routes.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';

class EndpointRedirect extends Redirect {
  @override
  Future<String?> redirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    final region = await getIt<ILocalDatabaseService>().getSelectedRegion();
    if ((region == null) && !ThingsboardAppConstants.ignoreRegionSelection) {
      return SelectRegionRoutes.selectRegion;
    }
    if (ThingsboardAppConstants.ignoreRegionSelection && region == null) {
      getIt<IEndpointService>().setEndpoint(
        ThingsboardAppConstants.thingsBoardApiEndpoint,
      );
      getIt<IEndpointService>().setRegion(Region.custom);
    }
    return null;
  }
}
