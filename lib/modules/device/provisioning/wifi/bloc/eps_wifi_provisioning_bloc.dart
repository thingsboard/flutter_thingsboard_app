import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/bloc/bloc.dart';
import 'package:thingsboard_app/utils/services/communication/events.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/provisioning/eps_wifi/i_wifi_provisioning_service.dart';

class EspWifiProvisioningBloc
    extends Bloc<EspWifiProvisioningEvent, EspWifiProvisioningState> {
  EspWifiProvisioningBloc({
    required this.wifiProvisioningService,
    required this.communicationService,
  }) : super(const EspWifiLoadingState()) {
    on(_onEvent);
  }

  factory EspWifiProvisioningBloc.create() {
    return EspWifiProvisioningBloc(
      wifiProvisioningService: getIt<IWifiProvisioningService>(),
      communicationService: getIt<ICommunicationService>(),
    );
  }

  final IWifiProvisioningService wifiProvisioningService;
  final ICommunicationService communicationService;

  Future<void> _onEvent(
    EspWifiProvisioningEvent event,
    Emitter<EspWifiProvisioningState> emit,
  ) async {
    switch (event) {
      case EspWifiScanBleDevicesEvent():
        emit(const EspWifiLoadingState());

        if (await Permission.bluetoothScan.request().isGranted &&
            await Permission.bluetoothConnect.request().isGranted &&
            await Permission.locationWhenInUse.request().isGranted &&
            await Permission.nearbyWifiDevices.request().isGranted) {
          final devices = await wifiProvisioningService.scanBleDevices(
            event.prefix,
          );

          emit(EspWifiBleDevicesState(devices));
        } else {
          emit(const EspBlePermissionsMissing());
        }

        break;

      case EspWifiScanNetworksEvent():
        emit(const EspWifiLoadingState());

        try {
          final networks = await wifiProvisioningService.scanWifiNetworks(
            deviceName: event.deviceName,
            proofOfPossession: event.pop,
          );

          emit(
            EspWifiNetworksState(
              networks,
              device: event.deviceName,
              pop: event.pop,
            ),
          );
        } catch (e) {
          emit(EspEstablishSessionError(event.deviceName));
        }

        break;

      case EspWifiProvisionDeviceEvent():
        emit(
          EspWifiProvisioningInProgressState(
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

        final result = await wifiProvisioningService.provisionWifi(
          deviceName: event.device,
          proofOfPossession: event.pop,
          ssid: event.ssid,
          passphrase: event.pass,
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

        break;
    }
  }
}
