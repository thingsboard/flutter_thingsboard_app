import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/assignee_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/repository/assignee/assignee_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/assignee/i_assigne_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/fetch_assignee_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

class AssigneeDi {
  AssigneeDi._();

  static void inti(ThingsboardClient tbClient, {required String scopeName}) {
    getIt.pushNewScope(
      scopeName: scopeName,
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

        locator.registerLazySingleton(
          () => AssigneeQueryCtrl(),
        );

        locator.registerFactory(
          () => FetchAssigneeUseCase(
            repository: locator(),
          ),
        );

        locator.registerLazySingleton<
            PaginationRepository<PageLink, AssigneeEntity>>(
          () => AssigneePaginationRepository(
            assigneeQueryCtrl: locator(),
            onFetchPageData: locator<FetchAssigneeUseCase>(),
          ),
        );

        locator.registerLazySingleton(
          () => AssigneeBloc(
            paginationRepository: locator(),
            queryCtrl: locator(),
            filtersService: locator(),
          ),
        );
      },
    );
  }

  static void dispose(String scopeName) {
    getIt<PaginationRepository<PageLink, AlarmType>>().dispose();
    getIt<AssigneeBloc>().close();
    getIt.dropScope(scopeName);
  }
}
