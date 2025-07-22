import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
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
      create:
          (_) => EspSoftApBloc.create(
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
                tbContext,
                title: Text(
                  () {
                    switch (state) {
                      case EspSoftAppLoadingState():
                        return S.of(context).connectingToDevice;
                      case EspManuallyConnectToDeviceNetworkState():
                        return S.of(context).connectToDevice;
                      case EspSoftApWiFiListState():
                        return S.of(context).selectWifiNetwork;
                      case EspSoftApProvisioningInProgressState():
                        return S.of(context).deviceProvisioning;
                      case EspSoftApConnectionErrorState():
                        return S.of(context).unableConnectToDevice;
                      case EspSoftApWifiNetworksNotFoundState():
                        return S.of(context).deviceNotAbleToFindWifiNearby;
                      default:
                        return '';
                    }
                  }(),
                  style: TbTextStyles.titleXs.copyWith(
                    color: Colors.black.withValues(alpha: .87),
                  ),
                ),
                leading: BackButton(
                  onPressed:
                      () => showDialog(
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
                      return const SizedBox.expand(
                        child: ColoredBox(
                          color: Color(0x99FFFFFF),
                          child: Center(child: TbProgressIndicator(size: 50)),
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
                        wifi:
                            state.wifiList
                                .map((e) => e.ssid).toSet()
                                .toList()
                                ,
                      );

                    case EspSoftApProvisioningInProgressState():
                      return DeviceProvisioningView(
                        tbContext,
                        deviceName: widget.tbDeviceName,
                        deviceSecretKey: widget.tbDeviceSecretKey,
                        ssid: state.ssid,
                        wifiPassword: state.password,
                        mustReconnectToWifiBeforeClaiming: true,
                        onProvisioningTryAgain:
                            () => context.read<EspSoftApBloc>().add(
                              const EspSoftApConnectToDeviceEvent(),
                            ),
                      );

                    case EspSoftApConnectionErrorState():
                      return EspSoftApConnectionErrorView(
                        onTryAgain:
                            () => context.read<EspSoftApBloc>().add(
                              const EspSoftApConnectToDeviceEvent(),
                            ),
                        assetPath: ThingsboardImage.mobileConnectionError,
                        message:
                            S.of(context).connectionToTheWifiNetworkFailednpleaseEnsureThatYour(widget.name),
                      );

                    case EspSoftApWifiNetworksNotFoundState():
                      return EspSoftApConnectionErrorView(
                        onTryAgain: () {},
                        assetPath: ThingsboardImage.mobileConnectionError,
                        message:
                            S.of(context).unableConnectToWifiBecauseNetworksWasntFoundByDevice(widget.name),
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
