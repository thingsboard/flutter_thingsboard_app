import 'package:firebase_core/firebase_core.dart';
import 'package:thingsboard_app/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';

class FirebaseService implements IFirebaseService {
  FirebaseService({
    required this.logger,
    required this.endpointService,
  });

  final ILoggerService logger;
  final _apps = <String>[];
  final IEndpointService endpointService;

  @override
  List<String> get apps => _apps;

  @override
  Future<FirebaseApp?> initializeApp({
    String name = defaultFirebaseAppName,
    FirebaseOptions? options,
  }) async {
    logger.debug('FirebaseService::initializeApp(name: $name)');

    try {
      if (await endpointService.isCustomEndpoint()) {
        throw UnimplementedError(
          'The current limitation is that Firebase can only be '
          'used with the endpoint with which the app was initially initialized.',
        );
      }

      final app = await Firebase.initializeApp(options: options, name: name);
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
