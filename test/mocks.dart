import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/firebase_service.dart';

class MockTbContext extends Mock implements TbContext {}

class MockTbClient extends Mock implements ThingsboardClient {}

class MockFirebaseService extends Mock implements FirebaseService {}

class MockEndpointService extends Mock implements EndpointService {}
