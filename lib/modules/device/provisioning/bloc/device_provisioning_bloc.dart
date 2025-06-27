import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plugin_wifi_connect/plugin_wifi_connect.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/communication/events/device_provisioning_status_changed_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';

class DeviceProvisioningBloc
    extends Bloc<DeviceProvisioningEvent, DeviceProvisioningState> {
  DeviceProvisioningBloc({
    required this.communicationService,
    required this.deviceName,
    required this.deviceSecretKey,
    required this.tbClient,
    required this.mustReconnectToWifiBeforeClaiming,
    required this.ssid,
    required this.wifiPassword,
    required this.logger,
  }) : super(const DeviceProvisioningIdleState()) {
    on(_onEvent);

    subscription = communicationService
        .on<DeviceProvisioningStatusChangedEvent>()
        .listen((event) {
      switch (event.status) {
        case DeviceProvisioningStatus.idle:
          add(const ProvisioningIdleEvent());
        case DeviceProvisioningStatus.wifi:
          add(const SendWifiCredentialsEvent());
        case DeviceProvisioningStatus.confirmation:
          add(const ConfirmConnectionEvent());
        case DeviceProvisioningStatus.success:
          add(const SuccessfullyProvisionedEvent());
        case DeviceProvisioningStatus.fail:
          add(const ErrorDuringProvisioningEvent());
        default:
          break;
      }
    });
  }

  factory DeviceProvisioningBloc.create({
    required String deviceName,
    required String deviceSecretKey,
    required ThingsboardClient tbClient,
    bool mustReconnectToWifiBeforeClaiming = false,
    String? ssid,
    String? wifiPassword,
  }) =>
      DeviceProvisioningBloc(
        communicationService: getIt<ICommunicationService>(),
        deviceName: deviceName,
        deviceSecretKey: deviceSecretKey,
        tbClient: tbClient,
        mustReconnectToWifiBeforeClaiming: mustReconnectToWifiBeforeClaiming,
        ssid: ssid,
        wifiPassword: wifiPassword,
        logger: getIt<TbLogger>(),
      );

  final ICommunicationService communicationService;
  late final StreamSubscription subscription;
  final ThingsboardClient tbClient;
  final TbLogger logger;

  /// Claiming data
  final String deviceName;
  final String deviceSecretKey;
  bool mustReconnectToWifiBeforeClaiming;
  final String? ssid;
  final String? wifiPassword;

  Future<void> _onEvent(
    DeviceProvisioningEvent event,
    Emitter<DeviceProvisioningState> emit,
  ) async {
    switch (event) {
      case SendWifiCredentialsEvent():
        emit(const DeviceProvisioningSendWifiCreds());

      case ConfirmConnectionEvent():
        emit(const DeviceProvisioningConfirmConnection());

      case SuccessfullyProvisionedEvent():
        emit(const DeviceProvisioningSuccessState());
        emit(const DeviceProvisioningClaimingWipState());

        if (mustReconnectToWifiBeforeClaiming) {
          try {
            final response = await PluginWifiConnect.connectToSecureNetwork(
              ssid!,
              wifiPassword!,
            );
            if (response == false) {
              emit(const DeviceProvisioningReconnectToWifiState());
              return;
            }
            await Future.delayed(const Duration(seconds: 5));
          } catch (_) {
            emit(const DeviceProvisioningReconnectToWifiState());
            return;
          }
        }

        try {
          final response = await tbClient
              .getDeviceService()
              .claimDevice(
                deviceName,
                ClaimRequest(secretKey: deviceSecretKey),
                // ignore errors is for handling errors by myself
                requestConfig: RequestConfig(ignoreErrors: true),
              )
              .timeout(
                const Duration(seconds: 20),
                onTimeout: () =>
                    throw Exception('Device claiming timeout reached'),
              );

          if (response.response == ClaimResponse.CLAIMED ||
              response.response == ClaimResponse.SUCCESS) {
            communicationService.fire(
              const DeviceProvisioningStatusChangedEvent(
                DeviceProvisioningStatus.done,
              ),
            );
          } else {
            emit(
              const DeviceProvisioningClaimingErrorState(
                'Something went wrong. Please try again.',
              ),
            );
          }
        } catch (e) {
          logger.error('Device claiming error: $e');

          String? message;
          if (e is ThingsboardError) {
            message = 'Device not found. '
                'Please contact the device provider.';
          }

          emit(DeviceProvisioningClaimingErrorState(message));
        }

      case ErrorDuringProvisioningEvent():
        emit(const DeviceProvisioningErrorState());

      case ProvisioningIdleEvent():
        emit(const DeviceProvisioningIdleState());

      case ProceedWithClaimingEvent():
        mustReconnectToWifiBeforeClaiming = false;
        add(const SuccessfullyProvisionedEvent());
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
