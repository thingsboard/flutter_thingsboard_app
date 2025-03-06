import 'dart:async';

// import 'package:esp_smartconfig/esp_smartconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart'
    show DeviceProvisioningStatus;
import 'package:thingsboard_app/modules/device/provisioning/smart_config/bloc/bloc.dart';
import 'package:thingsboard_app/utils/services/communication/events.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:wifi_scan/wifi_scan.dart';

enum SmartConfigVersion { espTouch, espTouchV2 }

class EspSmartConfigBloc
    extends Bloc<EspSmartConfigEvent, EspSmartConfigState> {
  EspSmartConfigBloc({
    required this.communicationService,
    required SmartConfigVersion smartConfigVersion,
  }) : super(const EspSmartConfigLoadingState()) {
    // provisioner = smartConfigVersion == SmartConfigVersion.espTouch
    //     ? Provisioner.espTouch()
    //     : Provisioner.espTouchV2();

    // subscription = provisioner.listen((data) {
    //   print(data);
    //   print('sxxxxx');
    // });

    on(_onEvent);
  }

  factory EspSmartConfigBloc.create(SmartConfigVersion version) {
    return EspSmartConfigBloc(
      communicationService: getIt<ICommunicationService>(),
      smartConfigVersion: version,
    );
  }

  final ICommunicationService communicationService;
  // late final Provisioner provisioner;
  late final StreamSubscription subscription;

  Future<void> _onEvent(
    EspSmartConfigEvent event,
    Emitter<EspSmartConfigState> emit,
  ) async {
    switch (event) {
      case EspSmartConfigScanNetworksEvent():
        final canScan = await WiFiScan.instance.canStartScan();
        if (canScan == CanStartScan.yes &&
            await Permission.nearbyWifiDevices.request().isGranted) {
          await WiFiScan.instance.startScan();
          final can = await WiFiScan.instance.canGetScannedResults();
          if (can == CanGetScannedResults.yes) {
            final results = await WiFiScan.instance.getScannedResults();
            emit(EspSmartConfigWiFiNetworksState(results));
          }
        } else {
          emit(const EspSmartConfigEnterNetworkManuallyState());
        }

        break;

      case EspSmartConfigStartEvent():
        emit(
          EspSmartConfigWipState(
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

        // await provisioner.start(
        //   ProvisioningRequest.fromStrings(
        //     ssid: event.ssid,
        //     password: event.password,
        //     encryptionKey: event.aesKey,
        //   ),
        // );

        communicationService.fire(
          const DeviceProvisioningStatusChangedEvent(
            DeviceProvisioningStatus.confirmation,
          ),
        );

        break;
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
