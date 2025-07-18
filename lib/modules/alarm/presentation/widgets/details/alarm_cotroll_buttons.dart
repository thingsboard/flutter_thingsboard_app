import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_details/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_status_button.dart';
import 'package:thingsboard_app/utils/ui/tb_alert_dialog.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmControlButtons extends StatelessWidget {
  const AlarmControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmDetailsBloc, AlarmDetailsState>(
      buildWhen: (_, state) => state is AlarmDetailsLoadedState,
      builder: (context, state) {
        if (state is AlarmDetailsLoadedState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 0.00), Colors.white],
                stops: [0.0088, 0.083],
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AlarmStatusButton(
                    text: S.of(context).clear,
                    onTap:
                        state.clear
                            ? () async {
                              final response = await showDialog<bool>(
                                context: context,
                                builder: (context) {
                                  return TbAlertDialog(
                                    title: Text(S.of(context).alarmClearTitle),
                                    content: Text(S.of(context).alarmClearText),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          S.of(context).no.toUpperCase(),
                                          style: TbTextStyles.labelLarge
                                              .copyWith(
                                                color: Colors.black.withValues(
                                                  alpha: .87,
                                                ),
                                              ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text(
                                          S.of(context).yes.toUpperCase(),
                                          style: TbTextStyles.labelLarge
                                              .copyWith(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).primaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (context.mounted && response == true) {
                                context.read<AlarmDetailsBloc>().add(
                                  ClearAlarmEvent(state.alarmInfo.id!),
                                );
                              }
                            }
                            : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AlarmStatusButton(
                    text: S.of(context).acknowledge,
                    onTap:
                        state.acknowledge
                            ? () async {
                              final response = await showDialog<bool>(
                                context: context,
                                builder: (context) {
                                  return TbAlertDialog(
                                    title: Text(
                                      S.of(context).alarmAcknowledgeTitle,
                                    ),
                                    content: Text(
                                      S.of(context).alarmAcknowledgeText,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          S.of(context).no.toUpperCase(),
                                          style: TbTextStyles.labelLarge
                                              .copyWith(
                                                color: Colors.black.withValues(
                                                  alpha: .87,
                                                ),
                                              ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text(
                                          S.of(context).yes.toUpperCase(),
                                          style: TbTextStyles.labelLarge
                                              .copyWith(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).primaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (context.mounted && response == true) {
                                context.read<AlarmDetailsBloc>().add(
                                  AcknowledgeAlarmEvent(state.alarmInfo.id!),
                                );
                              }
                            }
                            : null,
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
