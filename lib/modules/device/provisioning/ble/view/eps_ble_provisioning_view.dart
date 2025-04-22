import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/di/esp_ble_di.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/view/ble_devices_empty_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/view/cannot_establish_session_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/view/esp_wifi_network_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/device_provisioning_done.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/device_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/exit_confirmation_dialog.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class EspBleProvisioningView extends TbContextWidget {
  EspBleProvisioningView(
    super.tbContext, {
    required this.tbDeviceName,
    required this.tbDeviceSecretKey,
    required this.name,
    required this.poofOfPossession,
    super.key,
  });

  final String tbDeviceName;
  final String tbDeviceSecretKey;
  final String name;
  final String poofOfPossession;

  @override
  State<StatefulWidget> createState() => _EspBleProvisioningViewState();
}

class _EspBleProvisioningViewState
    extends TbContextState<EspBleProvisioningView> {
  final diKey = UniqueKey().toString();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EspBleProvisioningBloc>(
      create: (_) =>
          EspBleProvisioningBloc.create(tbContext.androidInfo?.version.sdkInt)
            ..add(
              EspBleScanNetworksEvent(
                deviceName: widget.name,
                pop: widget.poofOfPossession,
              ),
            ),
      child: BlocBuilder<EspBleProvisioningBloc, EspBleProvisioningState>(
        builder: (context, state) {
          return Scaffold(
            appBar: () {
              if (state is EspBleProvisioningDoneState) {
                return null;
              }

              return TbAppBar(
                title: Text(
                  () {
                    switch (state) {
                      case EspBleLoadingState():
                        return 'Connecting to device';
                      case EspBleNetworksState():
                        return 'Select Wi-Fi network';
                      case EspBleProvisioningInProgressState():
                        return 'Device provisioning';
                      case EspBlePermissionsMissing():
                        return 'Permissions';
                      case EspEstablishSessionError():
                        return 'Something went wrong';
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
                    case EspBleLoadingState():
                      return SizedBox.expand(
                        child: Container(
                          color: const Color(0x99FFFFFF),
                          child: const Center(
                            child: TbProgressIndicator(size: 50.0),
                          ),
                        ),
                      );

                    case EspBleNetworksState():
                      return EspWifiNetworkView(
                        device: state.device,
                        pop: state.pop,
                        networks: state.networks,
                        tbContext: tbContext,
                      );

                    case EspBleProvisioningInProgressState():
                      return DeviceProvisioningView(
                        tbContext,
                        deviceName: widget.tbDeviceName,
                        deviceSecretKey: widget.tbDeviceSecretKey,
                        onProvisioningTryAgain: () {
                          context.read<EspBleProvisioningBloc>().add(
                                EspBleProvisionDeviceEvent(
                                  device: state.device,
                                  pop: state.pop,
                                  ssid: state.ssid,
                                  pass: state.pass,
                                ),
                              );
                        },
                      );

                    case EspBlePermissionsMissing():
                      return BleDevicesEmptyView(
                        showOpenAppSettings: state.openAppSettings,
                        onTryAgain: () =>
                            context.read<EspBleProvisioningBloc>().add(
                                  EspBleScanNetworksEvent(
                                    deviceName: widget.name,
                                    pop: widget.poofOfPossession,
                                  ),
                                ),
                        message: () {
                          if (!state.openAppSettings) {
                            return S
                                .of(context)
                                .permissionsNotEnoughMessage(state.permissions);
                          }

                          return S
                              .of(context)
                              .openAppSettingsToGrantPermissionMessage(
                                state.permissions,
                              );
                        }(),
                      );

                    case EspEstablishSessionError():
                      return CannotEstablishSessionView(
                        onTryAgain: () {
                          context.read<EspBleProvisioningBloc>().add(
                                EspBleScanNetworksEvent(
                                  deviceName: widget.name,
                                  pop: widget.poofOfPossession,
                                ),
                              );
                        },
                        deviceName: S
                            .of(context)
                            .cannotEstablishSession(state.deviceName),
                      );

                    case EspBleProvisioningDoneState():
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
    EspBleDi.init(diKey);
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
    EspBleDi.dispose(diKey);
    super.dispose();
  }
}
