import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/device_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/di/esp_wifi_di.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/view/ble_devices_empty_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/view/ble_devices_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/view/cannot_establish_session_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/view/esp_wifi_network_view.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class EspBleProvisioningView extends TbContextWidget {
  EspBleProvisioningView(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _EspBleProvisioningViewState();
}

class _EspBleProvisioningViewState
    extends TbContextState<EspBleProvisioningView> {
  final diKey = UniqueKey().toString();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EspWifiProvisioningBloc>(
      create: (_) => EspWifiProvisioningBloc.create()
        ..add(const EspWifiScanBleDevicesEvent()),
      child: Scaffold(
        appBar: TbAppBar(
          tbContext,
          title: BlocBuilder<EspWifiProvisioningBloc, EspWifiProvisioningState>(
            builder: (context, state) {
              String title = '';

              switch (state) {
                case EspWifiLoadingState():
                  break;
                case EspWifiBleDevicesState():
                  title = 'BLE Devices';
                  break;
                case EspWifiNetworksState():
                  title = 'Select Wi-Fi network';
                  break;
                case EspWifiProvisioningInProgressState():
                  title = 'Device provisioning';
                  break;
                case EspBlePermissionsMissing():
                  title = 'Permissions';
                case EspEstablishSessionError():
                  title = 'Something went wrong';
              }

              return Text(
                title,
                style: TbTextStyles.titleXs.copyWith(
                  color: Colors.black.withOpacity(.87),
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child:
                BlocBuilder<EspWifiProvisioningBloc, EspWifiProvisioningState>(
              builder: (context, state) {
                switch (state) {
                  case EspWifiLoadingState():
                    return SizedBox.expand(
                      child: Container(
                        color: const Color(0x99FFFFFF),
                        child: const Center(
                          child: TbProgressIndicator(size: 50.0),
                        ),
                      ),
                    );

                  case EspWifiBleDevicesState():
                    if (state.devices.isEmpty) {
                      return BleDevicesEmptyView(
                        onTryAgain: () {},
                        message: S.of(context).deviceNotFoundMessage,
                      );
                    }

                    return BleDevicesView(
                      devices: state.devices,
                      tbContext: tbContext,
                    );

                  case EspWifiNetworksState():
                    return EspWifiNetworkView(
                      device: state.device,
                      pop: state.pop,
                      networks: state.networks,
                      tbContext: tbContext,
                    );

                  case EspWifiProvisioningInProgressState():
                    return DeviceProvisioningView(
                      onTryAgain: () {
                        context.read<EspWifiProvisioningBloc>().add(
                              EspWifiProvisionDeviceEvent(
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
                      onTryAgain: () async {
                        final statuses = await [
                          Permission.bluetoothScan,
                          Permission.bluetoothConnect,
                          Permission.locationWhenInUse,
                          Permission.nearbyWifiDevices,
                        ].request();

                        if (statuses.values.any(
                          (p) => p == PermissionStatus.permanentlyDenied,
                        )) {
                          openAppSettings();
                        } else if (context.mounted) {
                          context
                              .read<EspWifiProvisioningBloc>()
                              .add(const EspWifiScanBleDevicesEvent());
                        }
                      },
                      message: S.of(context).permissionsNotEnoughMessage,
                    );

                  case EspEstablishSessionError():
                    return CannotEstablishSessionView(
                      onTryAgain: () {
                        context
                            .read<EspWifiProvisioningBloc>()
                            .add(const EspWifiScanBleDevicesEvent());
                      },
                      deviceName: S
                          .of(context)
                          .cannotEstablishSession(state.deviceName),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    EspWifiDi.init(diKey);
    super.initState();
  }

  @override
  void dispose() {
    EspWifiDi.dispose(diKey);
    super.dispose();
  }
}
