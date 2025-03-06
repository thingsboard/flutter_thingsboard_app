import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/smart_config/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/smart_config/text_field_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/device_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/enter_password_dialog.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/help_message_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/scan_list_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class EspSmartConfigView extends TbContextWidget {
  EspSmartConfigView(
    super.tbContext, {
    required this.aesKey,
    required this.version,
    required this.deviceName,
    required this.deviceSecretKey,
    super.key,
  });

  final String aesKey;
  final SmartConfigVersion version;
  final String deviceName;
  final String deviceSecretKey;

  @override
  State<StatefulWidget> createState() => _EspSmartConfigViewState();
}

class _EspSmartConfigViewState extends TbContextState<EspSmartConfigView> {
  final networkTextCtrl = TextEditingController();
  final passNetworkTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EspSmartConfigBloc>(
      create: (_) => EspSmartConfigBloc.create(widget.version)
        ..add(const EspSmartConfigScanNetworksEvent()),
      child: Scaffold(
        appBar: TbAppBar(
          tbContext,
          title: BlocBuilder<EspSmartConfigBloc, EspSmartConfigState>(
            builder: (context, state) {
              String title = '';

              switch (state) {
                case EspSmartConfigLoadingState():
                  break;
                case EspSmartConfigEnterNetworkManuallyState():
                  // TODO: Handle this case.
                  break;
                case EspSmartConfigWiFiNetworksState():
                  title = 'Select Wi-Fi network';
                  break;
                case EspSmartConfigWipState():
                  title = 'Device provisioning';
                  break;
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
            child: BlocBuilder<EspSmartConfigBloc, EspSmartConfigState>(
              builder: (context, state) {
                switch (state) {
                  case EspSmartConfigLoadingState():
                    return SizedBox.expand(
                      child: Container(
                        color: const Color(0x99FFFFFF),
                        child: const Center(
                          child: TbProgressIndicator(size: 50.0),
                        ),
                      ),
                    );

                  case EspSmartConfigEnterNetworkManuallyState():
                    return Column(
                      children: [
                        HelpTextWidget(S.of(context).wifiHelpMessage('')),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          textEditingController: networkTextCtrl,
                          labelText: 'Network Name (SSID)',
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          textEditingController: passNetworkTextCtrl,
                          obscureText: true,
                          labelText: S.of(context).wifiPassword,
                          onChanged: (_) => setState(() {}),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                            ),
                            onPressed: networkTextCtrl.text.trim().isNotEmpty &&
                                    passNetworkTextCtrl.text.trim().isNotEmpty
                                ? () {
                                    context.read<EspSmartConfigBloc>().add(
                                          EspSmartConfigStartEvent(
                                            ssid: networkTextCtrl.text,
                                            password: passNetworkTextCtrl.text,
                                            aesKey: widget.aesKey,
                                          ),
                                        );
                                  }
                                : null,
                            child: Text(
                              'Next',
                              style: TbTextStyles.labelMedium.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                  case EspSmartConfigWiFiNetworksState():
                    return Column(
                      children: [
                        HelpTextWidget(S.of(context).wifiHelpMessage('')),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ScanListWidget(
                            state.networks
                                .map((e) => e.ssid)
                                .where((e) => e.isNotEmpty)
                                .toSet()
                                .toList()
                                .cast<String>(),
                            icon: Icons.wifi_outlined,
                            onTap: (network) async {
                              final networkPass =
                                  await tbContext.showFullScreenDialog(
                                PasswordDialog(
                                  helpMessage: S
                                      .of(context)
                                      .wifiPasswordMessage(network),
                                  textFieldLabel: S.of(context).wifiPassword,
                                ),
                                context: context,
                              );

                              if (networkPass != null && context.mounted) {
                                context.read<EspSmartConfigBloc>().add(
                                      EspSmartConfigStartEvent(
                                        ssid: network,
                                        password: networkPass,
                                        aesKey: widget.aesKey,
                                      ),
                                    );
                              }
                            },
                          ),
                        ),
                      ],
                    );

                  case EspSmartConfigWipState():
                    return DeviceProvisioningView(
                      tbContext,
                      deviceName: widget.deviceName,
                      deviceSecretKey: widget.deviceSecretKey,
                      onProvisioningTryAgain: () {
                        context.read<EspSmartConfigBloc>().add(
                              EspSmartConfigStartEvent(
                                ssid: state.ssid,
                                password: state.password,
                                aesKey: widget.aesKey,
                              ),
                            );
                      },
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
