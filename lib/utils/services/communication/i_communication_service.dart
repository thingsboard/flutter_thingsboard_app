import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

abstract interface class ICommunicationService {
  Stream<CommunicationEvent> on<CommunicationEvent>();

  void fire(CommunicationEvent event);
}
