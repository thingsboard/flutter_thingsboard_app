import 'package:get_it/get_it.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/local_database/local_database_service.dart';
import 'package:thingsboard_app/utils/services/tb_app_storage.dart';

import 'utils/services/firebase/firebase_service.dart';

final getIt = GetIt.instance;

void setUpRootDependencies() {
  getIt
    ..registerSingleton(
      ThingsboardAppRouter(),
    )
    ..registerLazySingleton(
      () => TbLogger(),
    )
    ..registerLazySingleton<ILocalDatabaseService>(
      () => LocalDatabaseService(
        storage: createAppStorage(),
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
    );
}
