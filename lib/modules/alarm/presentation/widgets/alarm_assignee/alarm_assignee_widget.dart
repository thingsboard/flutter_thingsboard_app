import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_state.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_assignee/alarm_assignee_list_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_widget.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class AlarmAssigneeWidget extends StatelessWidget {
  const AlarmAssigneeWidget({required this.tbContext, super.key});

  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: S.of(context).assignee,
      child: InkWell(
        onTap: () async {
          await UiUtils.showModalBottomSheet(
            context: context,
            topControl: const SizedBox.shrink(),
            builder:
                (_) => BlocProvider.value(
                  value: context.read<AlarmAssigneeBloc>(),
                  child: AnimatedSize(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    child: AlarmAssigneeListWidget(tbContext: tbContext),
                  ),
                ),
          );

          if (context.mounted) {
            context.read<AlarmAssigneeBloc>().add(
              const AlarmAssigneeResetSearchTextEvent(),
            );
          }
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 38),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withValues(alpha: 0.12)),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: BlocBuilder<AlarmAssigneeBloc, AlarmAssigneeState>(
            builder: (context, state) {
              switch (state) {
                case AlarmAssigneeEmptyState():
                  return Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.black.withValues(alpha: 0.38),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).unassigned,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withValues(alpha: 0.38),
                        ),
                      ),
                      const Spacer(),
                      Transform.rotate(
                        angle: -pi / 2,
                        child: Icon(
                          Icons.arrow_left_outlined,
                          color: Colors.black.withValues(alpha: .38),
                        ),
                      ),
                    ],
                  );

                case AlarmAssigneeSelectedState():
                  return Row(
                    children: [
                      Expanded(
                        child: UserInfoWidget(
                          id: state.assignee.userInfo.id.id ?? '',
                          avatar: UserInfoAvatarWidget(
                            shortName: state.assignee.shortName,
                            color: UiUtils.colorFromString(
                              state.assignee.displayName,
                            ),
                          ),
                          name: state.assignee.displayName,
                        ),
                      ),
                      Transform.rotate(
                        angle: -pi / 2,
                        child: Icon(
                          Icons.arrow_left_outlined,
                          color: Colors.black.withValues(alpha: .38),
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
