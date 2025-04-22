import 'package:firebase_core/firebase_core.dart';

abstract interface class IFirebaseService {
  const IFirebaseService();

  Future<FirebaseApp?> initializeApp({String name, FirebaseOptions? options});

  Future<void> removeApp({String name});

  List<String> get apps;
}
