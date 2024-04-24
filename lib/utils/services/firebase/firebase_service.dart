import 'package:firebase_core/firebase_core.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_app_storage.dart';

class FirebaseService implements IFirebaseService {
  FirebaseService({required this.logger});

  final TbLogger logger;
  final _apps = <String>[];

  @override
  List<String> get apps => _apps;

  @override
  Future<FirebaseApp?> initializeApp({
    String name = defaultFirebaseAppName,
    FirebaseOptions? options,
  }) async {
    try {
      final endpoint =
          await createAppStorage().getItem('thingsBoardApiEndpoint') ??
              ThingsboardAppConstants.thingsBoardApiEndpoint;
      if (endpoint != ThingsboardAppConstants.thingsBoardApiEndpoint) {
        logger.debug(Firebase.apps);

        throw UnimplementedError(
          'The current limitation is that Firebase can only be '
          'used with the endpoint with which the app was initially initialized.',
        );
      }

      final app = await Firebase.initializeApp(options: options);
      _apps.add(name);

      return app;
    } catch (e) {
      logger.error('FirebaseService:initializeApp $e');
    }

    return null;
  }

  @override
  Future<void> removeApp({String name = defaultFirebaseAppName}) async {
    try {
      await Firebase.app(name).delete();
    } catch (e) {
      logger.error('FirebaseService:removeApp $e');
    } finally {
      _apps.remove(name);
    }
  }
}
