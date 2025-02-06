import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/try_again_button.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class DeviceProvisioningView extends StatelessWidget {
  const DeviceProvisioningView({
    required this.onTryAgain,
    super.key,
  });

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceProvisioningBloc>(
      create: (_) => DeviceProvisioningBloc.create(),
      child: Column(
        children: [
          Center(
            child: BlocBuilder<DeviceProvisioningBloc, DeviceProvisioningState>(
              buildWhen: (_, state) =>
                  state is DeviceProvisioningErrorState ||
                  state is DeviceProvisioningIdleState,
              builder: (_, state) {
                if (state is DeviceProvisioningErrorState) {
                  return SvgPicture.asset(
                    ThingsboardImage.deviceProvisioningError,
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
          BlocBuilder<DeviceProvisioningBloc, DeviceProvisioningState>(
            builder: (context, state) {
              switch (state) {
                case DeviceProvisioningSendWifiCreds():
                  return _ConnectionStateRow(
                    S.of(context).sendingWifiCredentials,
                    inProgress: true,
                  );

                case DeviceProvisioningConfirmConnection():
                  return Column(
                    children: [
                      _ConnectionStateRow(
                        S.of(context).sendingWifiCredentials,
                        inProgress: false,
                      ),
                      _ConnectionStateRow(
                        S.of(context).confirmingWifiConnection,
                        inProgress: true,
                      ),
                    ],
                  );

                case DeviceProvisioningErrorState():
                  return Column(
                    children: [
                      _ConnectionStateRow(
                        S.of(context).sendingWifiCredentials,
                        inProgress: false,
                      ),
                      _ConnectionStateRow(
                        S.of(context).confirmingWifiConnection,
                        inProgress: false,
                        error: true,
                      ),
                    ],
                  );

                case DeviceProvisioningSuccessState():
                  return Column(
                    children: [
                      _ConnectionStateRow(
                        S.of(context).sendingWifiCredentials,
                        inProgress: false,
                      ),
                      _ConnectionStateRow(
                        S.of(context).confirmingWifiConnection,
                        inProgress: false,
                      ),
                      _ConnectionStateRow(
                        S.of(context).provisionedSuccessfully,
                        inProgress: false,
                      ),
                    ],
                  );

                case DeviceProvisioningIdleState():
                  return const SizedBox.shrink();
              }
            },
          ),
          const Spacer(),
          BlocBuilder<DeviceProvisioningBloc, DeviceProvisioningState>(
            builder: (context, state) {
              if (state is DeviceProvisioningSuccessState) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      S.of(context).returnToDashboard,
                      style: TbTextStyles.labelMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              } else if (state is DeviceProvisioningErrorState) {
                return TryAgainButton(onTryAgain: onTryAgain);
              }

              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    S.of(context).returnToDashboard,
                    style: TbTextStyles.labelMedium.copyWith(
                      color: Colors.black.withOpacity(.38),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ConnectionStateRow extends StatelessWidget {
  const _ConnectionStateRow(
    this.text, {
    required this.inProgress,
    this.error = false,
  });

  final bool inProgress;
  final String text;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          if (inProgress) const TbProgressIndicator(size: 24),
          if (!inProgress)
            Icon(
              error ? Icons.cancel_outlined : Icons.check_circle_outline,
              color: error ? const Color(0xffD12730) : const Color(0xff00695C),
            ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                text,
                style: TbTextStyles.bodyLarge.copyWith(
                  color: Colors.black.withOpacity(.76),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
