import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/assignee_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/repository/assignee/assignee_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/assignee/i_assigne_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/fetch_assignee_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AssigneeDi {
  static const _scopeName = 'AssigneeDi';

  static void inti(ThingsboardClient tbClient) {
    getIt.pushNewScope(
      scopeName: _scopeName,
      init: (locator) {
        locator.registerFactory<IAssigneeDatasource>(
          () => AssigneeDatasource(
            tbClient: tbClient,
          ),
        );

        locator.registerFactory<IAssigneeRepository>(
          () => AssigneeRepository(
            datasource: locator(),
          ),
        );

        locator.registerFactory(
          () => AssigneeQueryCtrl(),
        );

        locator.registerFactory(
          () => FetchAssigneeUseCase(
            repository: locator(),
          ),
        );

        locator.registerFactory<PaginationRepository<PageLink, UserInfo>>(
          () => AssigneePaginationRepository(
            assigneeQueryCtrl: locator(),
            onFetchPageData: locator<FetchAssigneeUseCase>(),
          ),
        );

        locator.registerLazySingleton(
          () => AssigneeBloc(
            paginationRepository: locator(),
            fetchAssigneeUseCase: locator(),
          ),
        );
      },
    );
  }

  static void dispose() {
    getIt<PaginationRepository<PageLink, AlarmType>>().dispose();
    getIt<AssigneeBloc>().close();
    getIt.dropScope(_scopeName);
  }
}
