import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/states/manually_reconnect_to_wifi.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/states/provision_states.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/return_to_dashboard_button.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/try_again_button.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/tost_notifications_extension.dart';

class DeviceProvisioningView extends TbContextStatelessWidget {
  DeviceProvisioningView(
    super.tbContext, {
    required this.onProvisioningTryAgain,
    required this.deviceSecretKey,
    required this.deviceName,
    this.mustReconnectToWifiBeforeClaiming = false,
    this.ssid,
    this.wifiPassword,
    super.key,
  });

  final VoidCallback onProvisioningTryAgain;
  final String deviceName;
  final String deviceSecretKey;
  final bool mustReconnectToWifiBeforeClaiming;
  final String? ssid;
  final String? wifiPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceProvisioningBloc>(
      create: (_) => DeviceProvisioningBloc.create(
        deviceName: deviceName,
        deviceSecretKey: deviceSecretKey,
        tbClient: tbClient,
        mustReconnectToWifiBeforeClaiming: mustReconnectToWifiBeforeClaiming,
        ssid: ssid,
        wifiPassword: wifiPassword,
      ),
      child: Column(
        children: [
          Center(
            child: BlocBuilder<DeviceProvisioningBloc, DeviceProvisioningState>(
              builder: (_, state) {
                if (state is DeviceProvisioningErrorState ||
                    state is DeviceProvisioningClaimingErrorState) {
                  return SvgPicture.asset(
                    ThingsboardImage.deviceProvisioningError,
                    width: 140,
                    height: 140,
                  );
                } else if (state is DeviceProvisioningReconnectToWifiState) {
                  return SvgPicture.asset(
                    ThingsboardImage.connectMobile,
                    width: 140,
                    height: 140,
                  );
                }

                return SvgPicture.asset(
                  ThingsboardImage.deviceProvisioning,
                  width: 140,
                  height: 140,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          BlocConsumer<DeviceProvisioningBloc, DeviceProvisioningState>(
            listener: (context, state) {
              if (state is DeviceProvisioningClaimingErrorState) {
                if (state.message != null) {
                  context.showErrorNotification(state.message!);
                }
              }
            },
            builder: (context, state) {
              switch (state) {
                case DeviceProvisioningSendWifiCreds():
                  return const SendingWifiCredentials();

                case DeviceProvisioningConfirmConnection():
                  return const ConfirmingWifiConnection();

                case DeviceProvisioningErrorState():
                  return const ProvisionError();

                case DeviceProvisioningSuccessState():
                  return const ProvisionSuccess();

                case DeviceProvisioningClaimingWipState():
                  return const ClaimingWip();

                case DeviceProvisioningClaimingErrorState():
                  return const ClaimingError();

                case DeviceProvisioningReconnectToWifiState():
                  return const ManuallyReconnectToWifi();

                case DeviceProvisioningIdleState():
                  return const SizedBox.shrink();
              }
            },
          ),
          const Spacer(),
          BlocBuilder<DeviceProvisioningBloc, DeviceProvisioningState>(
            builder: (context, state) {
              if (state is DeviceProvisioningErrorState) {
                return TryAgainButton(onTryAgain: onProvisioningTryAgain);
              } else if (state is DeviceProvisioningClaimingErrorState) {
                return ReturnToDashboardButton(
                  onTap: () => Navigator.of(context).pop(false),
                );
              } else if (state is DeviceProvisioningReconnectToWifiState) {
                return Column(
                  children: [
                    TryAgainButton(
                      label: 'Open Wi-Fi settings',
                      onTryAgain: () => Platform.isAndroid
                          ? const OpenSettingsPlusAndroid().wifi()
                          : const OpenSettingsPlusIOS().wifi(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                        child: Text(
                          'Ready',
                          style: TbTextStyles.labelMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          context
                              .read<DeviceProvisioningBloc>()
                              .add(const ProceedWithClaimingEvent());
                        },
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
