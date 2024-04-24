import 'package:get_it/get_it.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';

import 'utils/services/firebase/firebase_service.dart';

final getIt = GetIt.instance;

void setUpRootDependencies() {
  getIt.registerSingleton(ThingsboardAppRouter());
  getIt.registerLazySingleton(() => TbLogger());

  getIt.registerLazySingleton<IFirebaseService>(
    () => FirebaseService(logger: getIt()),
  );
}
