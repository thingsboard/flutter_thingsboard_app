import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/assignee_list_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_widget.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class AlarmAssigneeFilter extends StatelessWidget {
  const AlarmAssigneeFilter({
    required this.tbContext,
    required this.onChanged,
    super.key,
  });

  final TbContext tbContext;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: 'Assignee',
      child: InkWell(
        onTap: () {
          UiUtils.showModalBottomSheet(
            context: context,
            builder: (context) => AnimatedSize(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              child: AssigneeListWidget(
                tbContext: tbContext,
                onChanged: onChanged,
              ),
            ),
          );
        },
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.12),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
