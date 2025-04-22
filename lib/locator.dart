import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/routes/router.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/services/_tb_secure_storage.dart'
    show TbSecureStorage, createAppStorage;
import 'package:thingsboard_app/services/alarm/alarm_service.dart';
import 'package:thingsboard_app/services/alarm/i_alarm_service.dart';
import 'package:thingsboard_app/services/communication/communication_service.dart';
import 'package:thingsboard_app/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/services/dashboard/dashboard_service.dart';
import 'package:thingsboard_app/services/dashboard/i_dashboard_service.dart';
import 'package:thingsboard_app/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/services/firebase/firebase_service.dart';
import 'package:thingsboard_app/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/services/legacy/i_legacy_service.dart';
import 'package:thingsboard_app/services/legacy/legacy_service.dart';
import 'package:thingsboard_app/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/services/local_database/local_database_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/logger/tb_logger_service.dart';
import 'package:thingsboard_app/services/mobile/i_mobile_service.dart';
import 'package:thingsboard_app/services/mobile/mobile_service.dart';
import 'package:thingsboard_app/services/system/i_system_service.dart';
import 'package:thingsboard_app/services/system/system_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/services/tb_client/tb_client_service.dart';
import 'package:thingsboard_app/services/toast_notification/i_toast_notification_service.dart';
import 'package:thingsboard_app/services/toast_notification/tost_notification_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/services/user/user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show TbStorage, ThingsboardClient;

final getIt = GetIt.instance;
const tbClientScopeName = 'tbClientGetItScope';
const tbServicesScopeName = 'tbServicesScopeName';

extension TbGetItExt on GetIt {
  Future<void> setUpRootDependencies() async {
    final secureStorage = createAppStorage() as TbSecureStorage;
    await secureStorage.init();
    final systemService = SystemService();
    await systemService.init();

    getIt
      ..registerLazySingleton<ILoggerService>(
        () => TbLoggerService(),
      )
      ..registerLazySingleton<TbStorage>(() => secureStorage)
      ..registerLazySingleton<ILocalDatabaseService>(
        () => LocalDatabaseService(
          storage: getIt(),
          logger: getIt(),
        ),
      )
      ..registerLazySingleton<IEndpointService>(
        () => EndpointService(
          databaseService: getIt(),
        ),
      )
      ..registerLazySingleton<IFirebaseService>(
        () => FirebaseService(
          logger: getIt(),
          endpointService: getIt(),
        ),
      )
      ..registerLazySingleton<ICommunicationService>(
        () => CommunicationService(
          EventBus(allowLogging: EnvironmentVariables.verbose),
        ),
      )
      ..registerFactory(
        () => const UserDetailsUseCase(),
      )
      ..registerSingleton(
        ThingsboardAppRouter(),
      )
      ..registerFactory<IToastNotificationService>(
        () => ToastNotificationService(),
      )
      ..registerLazySingleton<ISystemService>(
        () => systemService,
      )
      ..registerLazySingleton<ILegacyService>(
        () => LegacyService(),
      );
  }

  ITbClientService registerThingsBoardClient(ThingsboardClient tbClient) {
    getIt.pushNewScope(
      scopeName: tbClientScopeName,
      init: (locator) {
        locator
          ..registerLazySingleton<IDashboardService>(
            () => DashboardService(
              communicationService: getIt(),
              tbClient: tbClient,
            ),
            dispose: (s) async => await s.dispose(),
          )
          ..registerSingleton<IUserService>(
            UserService(
              communicationService: getIt(),
              logger: getIt(),
              tbClient: tbClient,
            ),
            dispose: (s) async => await s.dispose(),
          )
          ..registerLazySingleton<IAlarmService>(
            () => AlarmService(
              tbClient: tbClient,
            ),
          )
          ..registerLazySingleton<IMobileService>(
            () => MobileService(
              tbClient: tbClient,
              logger: getIt(),
              systemService: getIt(),
            ),
          )
          ..registerLazySingleton<ITbClientService>(
            () => TBClientService(
              tbClient,
              communicationService: getIt(),
              dashboardService: locator(),
              alarmService: locator(),
              userService: locator(),
              mobileService: locator(),
            ),
            dispose: (s) async => await s.dispose(),
          );
      },
    );

    return getIt<ITbClientService>();
  }

  void registerServices() {
    getIt.pushNewScope(
      scopeName: tbServicesScopeName,
      init: (locator) {},
    );
  }
}
