import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class MockTbLogger extends Mock implements TbLogger {}

class MockTbClientService extends Mock implements ITbClientService {}

class MockThingsboardClient extends Mock implements ThingsboardClient {}

class MockLocalDatabaseService extends Mock implements ILocalDatabaseService {}

class MockFirebaseService extends Mock implements IFirebaseService {}

/// Registers the locator dependencies that services resolve in their field
/// initializers, so a test can construct them without booting the real app.
/// The locator is reset automatically when the current test finishes.
void registerTestDependencies({
  required ThingsboardClient tbClient,
  required ILocalDatabaseService localDatabase,
  required IFirebaseService firebaseService,
}) {
  final clientService = MockTbClientService();
  when(() => clientService.client).thenReturn(tbClient);

  getIt
    ..registerLazySingleton<TbLogger>(() => MockTbLogger())
    ..registerLazySingleton<ITbClientService>(() => clientService)
    ..registerLazySingleton<ILocalDatabaseService>(() => localDatabase)
    ..registerLazySingleton<IFirebaseService>(() => firebaseService);
  addTearDown(getIt.reset);
}
