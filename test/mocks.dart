import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/utils/services/firebase/firebase_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockTbContext extends Mock implements TbContext {}

class MockTbClient extends Mock implements ThingsboardClient {}

class MockFirebaseService extends Mock implements FirebaseService {}
