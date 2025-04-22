import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/di/esp_softap_di.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/view/esp_softap_error_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/view/widgets/manually_connect_to_wifi.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/view/widgets/wifi_list.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/device_provisioning_done.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/device_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/exit_confirmation_dialog.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class EspSoftApView extends TbContextWidget {
  EspSoftApView(
    super.tbContext, {
    required this.tbDeviceName,
    required this.tbDeviceSecretKey,
    required this.name,
    required this.proofOfPossession,
    super.key,
  });

  final String tbDeviceName;
  final String tbDeviceSecretKey;
  final String name;
  final String proofOfPossession;

  @override
  State<StatefulWidget> createState() => _EspSoftApViewState();
}

class _EspSoftApViewState extends TbContextState<EspSoftApView> {
  final diKey = UniqueKey().toString();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EspSoftApBloc>(
      create: (_) => EspSoftApBloc.create(
        deviceName: widget.name,
        pop: widget.proofOfPossession,
      ),
      child: BlocBuilder<EspSoftApBloc, EspSoftApState>(
        builder: (context, state) {
          return Scaffold(
            appBar: () {
              if (state is EspSoftApProvisioningDoneState) {
                return null;
              }

              return TbAppBar(
                title: Text(
                  () {
                    switch (state) {
                      case EspSoftAppLoadingState():
                        return 'Connecting to device';
                      case EspManuallyConnectToDeviceNetworkState():
                        return 'Connect to device';
                      case EspSoftApWiFiListState():
                        return 'Select Wi-Fi network';
                      case EspSoftApProvisioningInProgressState():
                        return 'Device provisioning';
                      case EspSoftApConnectionErrorState():
                        return 'Unable connect to device';
                      case EspSoftApWifiNetworksNotFoundState():
                        return 'Device not able to find Wi-Fi nearby';
                      default:
                        return '';
                    }
                  }(),
                  style: TbTextStyles.titleXs.copyWith(
                    color: Colors.black.withOpacity(.87),
                  ),
                ),
                leading: BackButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => const ExitConfirmationDialog(),
                  ),
                ),
              );
            }(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: () {
                  switch (state) {
                    case EspSoftAppLoadingState():
                      return SizedBox.expand(
                        child: Container(
                          color: const Color(0x99FFFFFF),
                          child: const Center(
                            child: TbProgressIndicator(size: 50),
                          ),
                        ),
                      );

                    case EspManuallyConnectToDeviceNetworkState():
                      return ManuallyConnectToWifi(
                        wifiName: widget.name,
                        poofOfPossession: widget.proofOfPossession,
                      );

                    case EspSoftApWiFiListState():
                      return WifiList(
                        tbContext,
                        wifi: state.wifiList
                            .map((e) => e['ssid'])
                            .toList()
                            .cast<String>(),
                      );

                    case EspSoftApProvisioningInProgressState():
                      return DeviceProvisioningView(
                        tbContext,
                        deviceName: widget.tbDeviceName,
                        deviceSecretKey: widget.tbDeviceSecretKey,
                        ssid: state.ssid,
                        wifiPassword: state.password,
                        mustReconnectToWifiBeforeClaiming: true,
                        onProvisioningTryAgain: () => context
                            .read<EspSoftApBloc>()
                            .add(const EspSoftApConnectToDeviceEvent()),
                      );

                    case EspSoftApConnectionErrorState():
                      return EspSoftApConnectionErrorView(
                        onTryAgain: () => context
                            .read<EspSoftApBloc>()
                            .add(const EspSoftApConnectToDeviceEvent()),
                        assetPath: ThingsboardImage.mobileConnectionError,
                        message:
                            'Connection to the ${widget.name} Wi-Fi network failed.\n'
                            'Please ensure that your phone is connected to the device Wi-Fi network '
                            'and that Local Network access is enabled for this app in your device settings.',
                      );

                    case EspSoftApWifiNetworksNotFoundState():
                      return EspSoftApConnectionErrorView(
                        onTryAgain: () {},
                        assetPath: ThingsboardImage.mobileConnectionError,
                        message: 'Unable connect to Wi-Fi because networks '
                            'wasn\'t found by device ${widget.name}',
                      );

                    case EspSoftApProvisioningDoneState():
                      return const DeviceProvisioningDone();
                  }
                }(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    EspSoftApDi.init(diKey);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    EspSoftApDi.dispose(diKey);
    super.dispose();
  }
}
