import 'package:event_bus_plus/event_bus_plus.dart' show AppEvent;
import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart'
    show DeviceProvisioningStatus;

part 'events.dart';
part 'i_communication_service.freezed.dart';

abstract interface class ICommunicationService {
  Stream<T> on<T extends CommunicationEvent>();

  void fire(CommunicationEvent event);

  /// Fire a event and wait for it to be completed
  void watch(CommunicationEvent event);

  /// Complete a event
  void complete(CommunicationEvent event, {CommunicationEvent? nextEvent});

  /// Subscribe `EventBus` on a specific type of event, and register responder to it.
  Stream<bool> whileInProgress<T extends CommunicationEvent>();
}
