import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:thingsboard_app/services/communication/i_communication_service.dart';

class CommunicationService implements ICommunicationService {
  const CommunicationService(this._eventBus);

  final IEventBus _eventBus;

  @override
  void fire(CommunicationEvent event) {
    _eventBus.fire(event);
  }

  @override
  Stream<T> on<T extends CommunicationEvent>() {
    return _eventBus.on<T>();
  }

  @override
  void complete(CommunicationEvent event, {CommunicationEvent? nextEvent}) {
    _eventBus.complete(event, nextEvent: nextEvent);
  }

  @override
  void watch(CommunicationEvent event) {
    _eventBus.watch(event);
  }

  @override
  Stream<bool> whileInProgress<T extends CommunicationEvent>() {
    return _eventBus.whileInProgress<T>();
  }
}
