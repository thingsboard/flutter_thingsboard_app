import 'dart:io' show Platform;

import 'package:esp_provisioning_softap/esp_provisioning_softap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/utils/services/provisioning/soft_ap/i_soft_ap_service.dart';

class EspSoftApBloc extends Bloc<EspSoftApEvent, EspSoftApState> {
  EspSoftApBloc({
    required this.softApService,
    required this.logger,
  }) : super(const EspConnectToDeviceNetworkState()) {
    on(_onEvent);
  }

  factory EspSoftApBloc.create() {
    return EspSoftApBloc(
      softApService: getIt<ISoftApService>(),
      logger: getIt<TbLogger>(),
    );
  }

  final ISoftApService softApService;
  late Provisioning provisioning;
  final TbLogger logger;

  Future<void> _onEvent(
    EspSoftApEvent event,
    Emitter<EspSoftApState> emit,
  ) async {
    switch (event) {
      case EspSoftApConnectToDeviceEvent():
        emit(const EspSoftAppLoadingState());

        try {
          if (Platform.isIOS) {
            provisioning = await softApService.startProvisioning(
              hostname: 'wifi-prov.local',
              pop: event.pop,
            );
          } else {
            provisioning = await softApService.startProvisioning(
              hostname: '192.168.4.1:80',
              pop: event.pop,
            );
          }
        } catch (e) {
          logger.error('Error connecting to device $e');
          emit(EspSoftApErrorState(e.toString()));
        }

        try {
          final wifiList = await softApService.startScanWiFi(provisioning);
          if (wifiList?.isNotEmpty == true) {
            emit(EspSoftApWiFiListState(wifiList!));
          } else {
            throw Exception('Error scan WiFi network');
          }
        } catch (e) {
          logger.error('Error scan WiFi network $e');
          emit(EspSoftApErrorState(e.toString()));
        }

        break;

      case EspSoftApStartProvisioningEvent():
        await softApService.sendWifiConfig(
          provisioning,
          ssid: event.ssid,
          password: event.password,
        );
        await softApService.applyWifiConfig(provisioning);

        final connectionStatus = await softApService.getStatus(provisioning);
        if (connectionStatus.state == WifiConnectionState.Connected) {
          emit(const EspSoftApProvisionedSuccessfullyState());
        }

        break;
    }
  }
}
