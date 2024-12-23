import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/alarm_types/alarm_types_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/alarm_types/i_alarm_types_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/repository/alarm_types/alarm_types_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_types/alarm_types_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_types/alarm_types_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/alarm_types/i_alarm_types_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarm_types/fetch_alarm_types_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/alarm_types_bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

class AlarmTypesDi {
  AlarmTypesDi._();

  static void init(ThingsboardClient tbClient, {required String scopeName}) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<IAlarmTypesDatasource>(
          () => AlarmTypesDatasource(
            tbClient: tbClient,
          ),
        );

        locator.registerFactory<IAlarmTypesRepository>(
          () => AlarmTypesRepository(
            datasource: locator(),
          ),
        );

        locator.registerFactory(
          () => AlarmTypesQueryCtrl(),
        );

        locator.registerFactory(
          () => FetchAlarmTypesUseCase(
            repository: locator(),
          ),
        );

        locator.registerFactory<PaginationRepository<PageLink, AlarmType>>(
          () => AlarmTypesPaginationRepository(
            alarmTypesQueryCtrl: locator(),
            onFetchPageData: locator<FetchAlarmTypesUseCase>(),
          ),
        );

        locator.registerLazySingleton(
          () => AlarmTypesBloc(
            paginationRepository: locator(),
            fetchAlarmTypesUseCase: locator(),
            filtersService: locator(),
          ),
        );
      },
    );
  }

  static void dispose(String scopeName) {
    getIt<PaginationRepository<PageLink, AlarmType>>().dispose();
    getIt<AlarmTypesBloc>().close();
    getIt.dropScope(scopeName);
  }
}
