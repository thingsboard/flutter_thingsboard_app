import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/thingsboard_client.dart' hide UserService;
import 'package:thingsboard_app/utils/services/communication/communication_service.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/device_info/device_info_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/firebase_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/services/layouts/layout_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/loading_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/local_database/local_database_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/overlay_service.dart';
import 'package:thingsboard_app/utils/services/storage/_tb_secure_storage.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/tb_client_service.dart';
import 'package:thingsboard_app/utils/services/user/i_user_service.dart';
import 'package:thingsboard_app/utils/services/user/user_service.dart';
import 'package:thingsboard_app/utils/services/version_service/i_version_service.dart';
import 'package:thingsboard_app/utils/services/version_service/version_service.dart';

final getIt = GetIt.instance;

Future<void> setUpRootDependencies() async {
  final secureStorage = createAppStorage() as TbSecureStorage;
  await secureStorage.init();
  final deviceInfoService = DeviceInfoService();
  await deviceInfoService.init();

  getIt
    ..registerLazySingleton<ILoadingService>(() => LoadingService())
    ..registerLazySingleton<IVersionService>(() => VersionService())
    ..registerLazySingleton(() => TbLogger())
    ..registerLazySingleton<TbStorage>(() => secureStorage)
    ..registerLazySingleton<ILocalDatabaseService>(
      () => LocalDatabaseService(storage: getIt(), logger: getIt()),
    )
    ..registerLazySingleton<IEndpointService>(
      () => EndpointService(databaseService: getIt()),
    )
    ..registerLazySingleton<IOverlayService>(() => OverlayService())
      ..registerLazySingleton<ThingsboardAppRouter>(() => ThingsboardAppRouter(overlayService: getIt()))
    ..registerLazySingleton<IDeviceInfoService>(() => deviceInfoService)
    // ..registerLazySingleton(() => TbContext())
    ..registerSingletonAsync<ITbClientService>(() async {
      final client = TbClientService();
      await client.init();
      return client;
    })
    ..registerLazySingleton(() => NotificationService())
    // ..registerSingleton(
    //   ThingsboardAppRouter(overlayService: getIt(), tbContext: getIt()),
    // )
    ..registerLazySingleton<IFirebaseService>(
      () => FirebaseService(logger: getIt(), endpointService: getIt()),
    )
    ..registerLazySingleton<ICommunicationService>(
      () => CommunicationService(EventBus()),
    )
    ..registerSingleton<IUserService>(UserService())
    ..registerLazySingleton<ILayoutService>(() => LayoutService(getIt()))
    ..registerFactory(() => const UserDetailsUseCase());
  await getIt.getAsync<ITbClientService>();
}
