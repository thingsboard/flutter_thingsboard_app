import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart';
import 'package:thingsboard_app/utils/services/communication/events.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';

class DeviceProvisioningBloc
    extends Bloc<DeviceProvisioningEvent, DeviceProvisioningState> {
  DeviceProvisioningBloc({
    required this.communicationService,
  }) : super(const DeviceProvisioningIdleState()) {
    on(_onEvent);

    subscription = communicationService
        .on<DeviceProvisioningStatusChangedEvent>()
        .listen((event) {
      switch (event.status) {
        case DeviceProvisioningStatus.idle:
          add(const ProvisioningIdleEvent());
          break;
        case DeviceProvisioningStatus.wifi:
          add(const SendWifiCredentialsEvent());
          break;
        case DeviceProvisioningStatus.confirmation:
          add(const ConfirmConnectionEvent());
          break;
        case DeviceProvisioningStatus.success:
          add(const SuccessfullyProvisionedEvent());
          break;
        case DeviceProvisioningStatus.fail:
          add(const ErrorDuringProvisioningEvent());
          break;
      }
    });
  }

  factory DeviceProvisioningBloc.create() => DeviceProvisioningBloc(
        communicationService: getIt<ICommunicationService>(),
      );

  final ICommunicationService communicationService;
  late final StreamSubscription subscription;

  Future<void> _onEvent(
    DeviceProvisioningEvent event,
    Emitter<DeviceProvisioningState> emit,
  ) async {
    switch (event) {
      case SendWifiCredentialsEvent():
        emit(const DeviceProvisioningSendWifiCreds());
        break;
      case ConfirmConnectionEvent():
        emit(const DeviceProvisioningConfirmConnection());
        break;
      case SuccessfullyProvisionedEvent():
        emit(const DeviceProvisioningSuccessState());
        break;
      case ErrorDuringProvisioningEvent():
        emit(const DeviceProvisioningErrorState());
        break;
      case ProvisioningIdleEvent():
        emit(const DeviceProvisioningIdleState());
        break;
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
