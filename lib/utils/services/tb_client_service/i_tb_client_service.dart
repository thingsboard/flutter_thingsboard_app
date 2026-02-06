import 'dart:ui';

import 'package:thingsboard_app/thingsboard_client.dart';

abstract interface class ITbClientService {
  Future<void> init();
  ThingsboardClient get client;
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  });
}
