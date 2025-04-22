import 'package:thingsboard_app/features/alarm/data/datasource/alarms/alarms_datasource.dart';
import 'package:thingsboard_app/features/alarm/data/datasource/alarms/i_alarms_datasource.dart';
import 'package:thingsboard_app/features/alarm/data/repository/alarms/alarms_repository.dart';
import 'package:thingsboard_app/features/alarm/di/alarm_types_di.dart';
import 'package:thingsboard_app/features/alarm/di/assignee_di.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/alarms/alarms_pagination_repository.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/alarms/alarms_query_ctrl.dart';
import 'package:thingsboard_app/features/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/alarms/fetch_alarms_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarms_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/alarm_filters_service.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmsDi {
  AlarmsDi._();

  static void init(
    final String scopeName, {
    required String typesScopeName,
    required String assigneeScopeName,
  }) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<IAlarmsDatasource>(
          () => AlarmsDatasource(
            thingsboardClient: getIt(),
          ),
        );

        locator.registerFactory<IAlarmsRepository>(
          () => AlarmsRepository(
            datasource: locator(),
          ),
        );

        locator.registerLazySingleton(
          () => AlarmQueryController(),
        );

        locator.registerFactory(
          () => FetchAlarmsUseCase(
            repository: locator(),
          ),
        );

        locator.registerLazySingleton<
            PaginationRepository<AlarmQueryV2, AlarmInfo>>(
          () => AlarmsPaginationRepository(
            queryController: locator(),
            onFetchData: locator<FetchAlarmsUseCase>(),
          ),
        );

        locator.registerLazySingleton<IAlarmFiltersService>(
          () => AlarmFiltersService(logger: locator()),
        );

        locator.registerLazySingleton(
          () => AlarmBloc(
            paginationRepository: locator(),
            fetchAlarmsUseCase: locator(),
            queryController: locator(),
          ),
        );

        AlarmTypesDi.init(scopeName: typesScopeName);
        AssigneeDi.inti(scopeName: assigneeScopeName);
      },
    );
  }

  static void dispose(
    final String scopeName, {
    required String typesScopeName,
    required String assigneeScopeName,
  }) {
    AlarmTypesDi.dispose(typesScopeName);
    AssigneeDi.dispose(assigneeScopeName);
    getIt<PaginationRepository<AlarmQuery, AlarmInfo>>().dispose();
    getIt<AlarmBloc>().close();
    getIt.dropScope(scopeName);
  }
}
