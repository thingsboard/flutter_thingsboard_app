import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_query_ctrl.dart';
import 'package:thingsboard_app/modules/dashboard/domain/usecases/fetch_dashboards_usecase.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract class DashboardsDi {
  static void init(
    String key, {
    required ThingsboardClient tbClient,
  }) {
    getIt.pushNewScope(
      scopeName: key,
      init: (locator) {
        locator.registerLazySingleton(
          () => DashboardsQueryCtrl(),
        );

        locator.registerFactory(
          () => FetchDashboardsUseCase(tbClient),
        );

        locator.registerLazySingleton(
          () => DashboardsPaginationRepository(
            queryController: locator(),
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
