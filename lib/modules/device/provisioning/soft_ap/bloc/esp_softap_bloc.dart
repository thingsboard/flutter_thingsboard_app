import 'dart:async';
import 'dart:io';

import 'package:esp_provisioning_softap/esp_provisioning_softap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plugin_wifi_connect/plugin_wifi_connect.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart'
    show DeviceProvisioningStatus;
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/utils/services/communication/events.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/provisioning/soft_ap/i_soft_ap_service.dart';

class EspSoftApBloc extends Bloc<EspSoftApEvent, EspSoftApState> {
  EspSoftApBloc({
    required this.softApService,
    required this.logger,
    required this.communicationService,
    required this.deviceName,
    required this.pop,
  }) : super(
          Platform.isAndroid
              ? const EspConnectToDeviceNetworkState()
              : const EspSoftAppLoadingState(),
        ) {
    on(_onEvent);

    subscription = communicationService
        .on<DeviceProvisioningStatusChangedEvent>()
        .listen((event) {
      if (event.status == DeviceProvisioningStatus.done) {
        add(const EspSoftApProvisioningDoneEvent());
      }
    });

    if (Platform.isIOS) {
      add(const EspSoftApAutoConnectToDeviceWifi());
    }
  }

  factory EspSoftApBloc.create({
    required String deviceName,
    required String pop,
  }) {
    return EspSoftApBloc(
      softApService: getIt<ISoftApService>(),
      logger: getIt<TbLogger>(),
      communicationService: getIt<ICommunicationService>(),
      deviceName: deviceName,
      pop: pop,
    );
  }

  final ISoftApService softApService;
  late Provisioning provisioning;
  final TbLogger logger;
  final ICommunicationService communicationService;
  final String deviceName;
  final String pop;
  late final StreamSubscription subscription;

  Future<void> _onEvent(
    EspSoftApEvent event,
    Emitter<EspSoftApState> emit,
  ) async {
    switch (event) {
      case EspSoftApConnectToDeviceEvent():
        emit(const EspSoftAppLoadingState());

        try {
          provisioning = await softApService
              .startProvisioning(
                hostname: '192.168.4.1:80',
                pop: event.pop,
              )
              .timeout(
                const Duration(seconds: 20),
                onTimeout: () => throw Exception(
                  'SoftAp startProvisioning timeout reached.',
                ),
              );
        } catch (e) {
          logger.error('Error connecting to device $e');
          emit(const EspSoftApConnectionErrorState());
          break;
        }

        try {
          final wifiList =
              await softApService.startScanWiFi(provisioning).timeout(
                    const Duration(seconds: 20),
                    onTimeout: () => throw Exception(
                      'SoftAp startScanWiFi timeout reached',
                    ),
                  );
          if (wifiList?.isNotEmpty == true) {
            emit(EspSoftApWiFiListState(wifiList!));
          } else {
            throw Exception('Error scan WiFi network');
          }
        } catch (e) {
          logger.error('Error scan WiFi network $e');
          emit(const EspSoftApWifiNetworksNotFoundState());
          break;
        }

        break;

      case EspSoftApStartProvisioningEvent():
        emit(
          EspSoftApProvisioningInProgressState(
            ssid: event.ssid,
            password: event.password,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 500));
        communicationService.fire(
          const DeviceProvisioningStatusChangedEvent(
            DeviceProvisioningStatus.wifi,
          ),
        );

        try {
          await softApService.sendWifiConfig(
            provisioning,
            ssid: event.ssid,
            password: event.password,
          );
          await softApService.applyWifiConfig(provisioning);

          communicationService.fire(
            const DeviceProvisioningStatusChangedEvent(
              DeviceProvisioningStatus.confirmation,
            ),
          );

          await Future.delayed(const Duration(seconds: 10));
          final status = await softApService.getStatus(provisioning);
          if (status.state == WifiConnectionState.Connected) {
            communicationService.fire(
              const DeviceProvisioningStatusChangedEvent(
                DeviceProvisioningStatus.success,
              ),
            );
          } else {
            communicationService.fire(
              const DeviceProvisioningStatusChangedEvent(
                DeviceProvisioningStatus.fail,
              ),
            );
          }
        } catch (e) {
          logger.error('Error provisioning device $e');
          communicationService.fire(
            const DeviceProvisioningStatusChangedEvent(
              DeviceProvisioningStatus.fail,
            ),
          );
        } finally {
          await provisioning.dispose();
          await Future.delayed(const Duration(seconds: 5));
        }

        break;

      case EspSoftApAutoConnectToDeviceWifi():
        bool? connectionResult;
        try {
          connectionResult = await PluginWifiConnect.connect(deviceName);
          await Future.delayed(const Duration(seconds: 5));
        } catch (_) {
          emit(const EspConnectToDeviceNetworkState());
        } finally {
          if (connectionResult == true) {
            add(EspSoftApConnectToDeviceEvent(pop));
          } else {
            emit(const EspConnectToDeviceNetworkState());
          }
        }

        break;

      case EspSoftApManuallyConnectToDeviceWifi():
        emit(const EspConnectToDeviceNetworkState());
        break;

      case EspSoftApProvisioningDoneEvent():
        emit(const EspSoftApProvisioningDoneState());
        break;
    }
  }

  @override
  Future<void> close() {
    provisioning.dispose();
    subscription.cancel();
    return super.close();
  }
}
