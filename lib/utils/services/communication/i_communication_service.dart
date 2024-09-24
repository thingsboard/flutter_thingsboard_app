import 'package:thingsboard_app/utils/services/communication/events.dart';

abstract interface class ICommunicationService {
  Stream<CommunicationEvent> on<CommunicationEvent>();

  void fire(CommunicationEvent event);
}
