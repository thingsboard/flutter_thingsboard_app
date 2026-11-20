// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_query_ctrl.dart';
import 'package:thingsboard_app/modules/dashboard/domain/usecases/fetch_dashboards_usecase.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

abstract class ProfileDi {
  static void init(String key) {
    getIt.pushNewScope(
      scopeName: key,
      init: (locator) {
        locator.registerLazySingleton(() => DashboardsQueryCtrl());
        locator.registerFactory(
          () => FetchDashboardsUseCase(getIt<ITbClientService>().client),
        );
        locator.registerLazySingleton(
          () => DashboardsPaginationRepository(
            queryController: locator<DashboardsQueryCtrl>(),
            onFetchData: locator<FetchDashboardsUseCase>(),
          ),
        );
      },
    );
  }

  static void dispose(String scopeName) {
    getIt.dropScope(scopeName);
  }
}
