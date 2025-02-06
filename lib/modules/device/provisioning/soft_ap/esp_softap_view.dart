import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/enter_device_pop_dialog.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/di/esp_softap_di.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class EspSoftApView extends TbContextWidget {
  EspSoftApView(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _EspSoftApViewState();
}

class _EspSoftApViewState extends TbContextState<EspSoftApView> {
  final diKey = UniqueKey().toString();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EspSoftApBloc>(
      create: (_) => EspSoftApBloc.create(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<EspSoftApBloc, EspSoftApState>(
            builder: (context, state) {
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

                case EspConnectToDeviceNetworkState():
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Please connect WiFi to ESP32 AP (PROV_XXX) in "Wi-Fi Settings". '
                        'Once you complete it please tap on "Ready" button.',
                      ),
                      TextButton(
                        child: const Text('Ready'),
                        onPressed: () async {
                          final pop = await showDialog(
                            context: context,
                            builder: (context) {
                              return DevicePopDialog(
                                helpMessage: S.of(context).popTitle('PROV_XXX'),
                                textFieldLabel: 'PIN',
                              );
                            },
                          );

                          if (pop != null && context.mounted) {
                            context.read<EspSoftApBloc>().add(
                                  EspSoftApConnectToDeviceEvent(pop),
                                );
                          }
                        },
                      ),
                    ],
                  );
                case EspSoftApErrorState():
                  return const SizedBox.shrink();

                case EspSoftApWiFiListState():
                  return Container();
                // return ScanList(
                //   state.wifiList,
                //   Icons.wifi_outlined,
                //   onTap: (item, _) async {
                //     final password = await showDialog(
                //       context: context,
                //       builder: (context) {
                //         return DevicePopDialog(
                //           helpMessage: S.of(context).popTitle(item['ssid']),
                //           textFieldLabel: 'TODO',
                //         );
                //       },
                //     );
                //
                //     if (password != null && context.mounted) {
                //       context.read<EspSoftApBloc>().add(
                //             EspSoftApStartProvisioningEvent(
                //               ssid: item['ssid'],
                //               password: password,
                //             ),
                //           );
                //     }
                //   },
                // );

                case EspSoftApProvisionedSuccessfullyState():
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Connected Successfully!'),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    EspSoftApDi.init(diKey);
    super.initState();
  }

  @override
  void dispose() {
    EspSoftApDi.dispose(diKey);
    super.dispose();
  }
}
