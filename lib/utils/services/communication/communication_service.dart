import 'package:event_bus/event_bus.dart';
import 'package:thingsboard_app/utils/services/communication/communication_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';

class CommunicationService implements ICommunicationService {
  const CommunicationService(EventBus eventBus) : _eventBus = eventBus;

  final EventBus _eventBus;

  @override
  void fire(CommunicationEvent event) {
    _eventBus.fire(event);
  }

  @override
  Stream<CommunicationEvent> on<CommunicationEvent>() {
    return _eventBus.on<CommunicationEvent>();
  }
}
