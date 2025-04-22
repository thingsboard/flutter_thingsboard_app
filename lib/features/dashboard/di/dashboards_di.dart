import 'package:thingsboard_app/features/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/features/dashboard/domain/pagination/dashboards_query_ctrl.dart';
import 'package:thingsboard_app/features/dashboard/domain/usecases/fetch_dashboards_usecase.dart';
import 'package:thingsboard_app/locator.dart';

abstract class DashboardsDi {
  static void init(String key) {
    getIt.pushNewScope(
      scopeName: key,
      init: (locator) {
        locator.registerLazySingleton(
          () => DashboardsQueryCtrl(),
        );

        locator.registerFactory(
          () => FetchDashboardsUseCase(getIt()),
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
