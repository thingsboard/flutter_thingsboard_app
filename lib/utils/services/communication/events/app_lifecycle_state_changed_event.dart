import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:thingsboard_app/utils/services/communication/communication_event.dart';


final class AppLifecycleStateChangedEvent extends CommunicationEvent {
  const AppLifecycleStateChangedEvent(this.state);

  final AppLifecycleState state;

  @override
  List<Object?> get props => [state];
}
