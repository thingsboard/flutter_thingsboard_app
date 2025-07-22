import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/models/provisioning_permission_type.dart';
import 'package:thingsboard_app/utils/services/communication/events/device_provisioning_status_changed_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/provisioning/eps_ble/i_wifi_provisioning_service.dart';

class EspBleProvisioningBloc
    extends Bloc<EspBleProvisioningEvent, EspBleProvisioningState> {
  EspBleProvisioningBloc({
    required this.bleProvisioningService,
    required this.communicationService,
    required this.logger,
    required this.androidSdkVersion,
  }) : super(const EspBleLoadingState()) {
    on(_onEvent);

    subscription = communicationService
        .on<DeviceProvisioningStatusChangedEvent>()
        .listen((event) {
      if (event.status == DeviceProvisioningStatus.done) {
        add(const EspBleProvisioningDoneEvent());
      }
    });
  }

  factory EspBleProvisioningBloc.create(int? androidSdkVersion) {
    return EspBleProvisioningBloc(
      bleProvisioningService: getIt<IBleProvisioningService>(),
      communicationService: getIt<ICommunicationService>(),
      logger: getIt<TbLogger>(),
      androidSdkVersion: androidSdkVersion,
    );
  }

  final IBleProvisioningService bleProvisioningService;
  final ICommunicationService communicationService;
  final TbLogger logger;
  final int? androidSdkVersion;
  late final StreamSubscription subscription;

  Future<void> _onEvent(
    EspBleProvisioningEvent event,
    Emitter<EspBleProvisioningState> emit,
  ) async {
    switch (event) {
      case EspBleScanNetworksEvent():
        emit(const EspBleLoadingState());

        if (Platform.isIOS) {
          final status = await Permission.bluetooth.request();
          if (status == PermissionStatus.permanentlyDenied) {
            emit(
               const EspBlePermissionsMissing(
                openAppSettings: true,
                permissions: ProvisioningPermissionsType.bluetooth,
              ),
            );
            return;
          }
        } else if (Platform.isAndroid && androidSdkVersion! > 30) {
          final status = await Permission.bluetoothScan.request();
          if (status == PermissionStatus.permanentlyDenied) {
            emit(
              const EspBlePermissionsMissing(
                openAppSettings: true,
                permissions: ProvisioningPermissionsType.nearbyDevices,
              ),
            );
            return;
          } else if (!status.isGranted) {
            emit(
              const EspBlePermissionsMissing(
                openAppSettings: false,
                permissions: ProvisioningPermissionsType.nearbyDevices,
              ),
            );
            return;
          }
        } else if (Platform.isAndroid && androidSdkVersion! < 30) {
          final status = await Permission.location.request();
          if (status == PermissionStatus.permanentlyDenied ||
              status == PermissionStatus.denied) {
            emit(
              EspBlePermissionsMissing(
                openAppSettings: status == PermissionStatus.permanentlyDenied,
                permissions: ProvisioningPermissionsType.location,
              ),
            );
            return;
          }
        }

        try {
          // This workaround because otherwise the library don't start connection to device.
          await bleProvisioningService.scanBleDevices('');
          final networks = await bleProvisioningService
              .scanWifiNetworks(
                deviceName: event.deviceName,
                proofOfPossession: event.pop,
              )
              .timeout(
                const Duration(seconds: 20),
                onTimeout: () => throw Exception(
                  'Scan Wi-Fi networks by device timeout reached',
                ),
              );

          emit(
            EspBleNetworksState(
              networks,
              device: event.deviceName,
              pop: event.pop,
            ),
          );
        } catch (e) {
          logger.error('Ble scan Wi-Fi networks by device error: $e');
          emit(EspEstablishSessionError(event.deviceName));
        }


      case EspBleProvisionDeviceEvent():
        emit(
          EspBleProvisioningInProgressState(
            device: event.device,
            pop: event.pop,
            ssid: event.ssid,
            pass: event.pass,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 500));
        communicationService.fire(
          const DeviceProvisioningStatusChangedEvent(
            DeviceProvisioningStatus.wifi,
          ),
        );

        await Future.delayed(const Duration(seconds: 1));
        communicationService.fire(
          const DeviceProvisioningStatusChangedEvent(
            DeviceProvisioningStatus.confirmation,
          ),
        );

        try {
          final result = await bleProvisioningService
              .provisionWifi(
                deviceName: event.device,
                proofOfPossession: event.pop,
                ssid: event.ssid,
                passphrase: event.pass,
              )
              .timeout(
                const Duration(seconds: 20),
                onTimeout: () => throw Exception(
                  'Device provisioning timeout reached',
                ),
              );

          if (result == true) {
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
          logger.error('Ble provisioning device failed with error $e');
          communicationService.fire(
            const DeviceProvisioningStatusChangedEvent(
              DeviceProvisioningStatus.fail,
            ),
          );
          break;
        }

      case EspBleProvisioningDoneEvent():
        emit(const EspBleProvisioningDoneState());
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
