import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/assignee/assignee_event.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/assignee/assignee_state.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/alarm_filter_widget.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/assignee_list_widget.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/user_info_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class AlarmAssigneeFilterWidget extends StatelessWidget {
  const AlarmAssigneeFilterWidget({required this.onChanged, super.key});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: 'Assignee',
      child: InkWell(
        onTap: () async {
          await UiUtils.showModalBottomSheet(
            context: context,
            topControl: const SizedBox.shrink(),
            builder: (context) => AnimatedSize(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              child: AssigneeListWidget(
                onChanged: onChanged,
              ),
            ),
          );
          getIt<AssigneeBloc>().add(const AssigneeResetSearchTextEvent());
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 38),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.12),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: BlocBuilder<AssigneeBloc, AssigneeState>(
            builder: (context, state) {
              switch (state) {
                case AssigneeEmptyState():
                  return Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.black.withOpacity(0.38),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.38),
                        ),
                      ),
                    ],
                  );
                case AssigneeSelectedState():
                  return UserInfoWidget(
                    id: state.assignee.userInfo.id.id ?? '',
                    avatar: UserInfoAvatarWidget(
                      shortName: state.assignee.shortName,
                      color: HSLColor.fromAHSL(
                        1,
                        state.assignee.displayName.hashCode % 360,
                        40 / 100,
                        60 / 100,
                      ).toColor(),
                    ),
                    name: state.assignee.displayName,
                  );
                case AssigneeSelfAssignmentState():
                  return UserInfoWidget(
                    avatar: Icon(
                      Icons.account_circle,
                      color: Colors.black.withOpacity(0.38),
                    ),
                    name: 'Assigned to me',
                    id: '',
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
