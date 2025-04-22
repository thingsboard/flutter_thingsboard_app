import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/activity/alarm_activity_pagination_repository.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_events.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_states.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/activity/activity_builder_widget.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/activity/alarm_comment_textfield.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/activity/alarm_edit_comment_textfield.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/alarm_filter_widget.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/pagination_list_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/new_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class AlarmActivityWidget extends StatefulWidget {
  const AlarmActivityWidget(
    this.alarmId, {
    required this.userId,
    super.key,
  });

  final UserId userId;
  final AlarmId alarmId;

  @override
  State<StatefulWidget> createState() => _AlarmActivityWidgetState();
}

class _AlarmActivityWidgetState extends State<AlarmActivityWidget> {
  double height = 192;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlarmActivityBloc>(
      create: (_) => AlarmActivityBloc.create(id: widget.alarmId)
        ..add(const AlarmActivityFetchEvent()),
      child: AlarmFilterWidget(
        filterTitle: S.of(context).activity,
        action: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Icon(
            Icons.refresh_rounded,
            color: Colors.black.withValues(alpha: .54),
          ),
          onTap: () {
            getIt<AlarmActivityPaginationRepository>()
                .pagingController
                .refresh();
          },
        ),
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AlarmActivityBloc, AlarmActivityState>(
              buildWhen: (_, state) => state is AlarmActivityLoadedState,
              builder: (_, state) {
                if (state is AlarmActivityLoadedState &&
                    state.hasSomeActivity) {
                  return Container(
                    height: 192,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.03),
                      border: Border(
                        top: BorderSide(
                          color: Colors.black.withOpacity(.12),
                        ),
                        bottom: BorderSide(
                          color: Colors.black.withOpacity(.12),
                        ),
                      ),
                    ),
                    child: PaginationListWidget<AlarmCommentsQuery,
                        AlarmCommentInfo>(
                      pagingController:
                          getIt<AlarmActivityPaginationRepository>()
                              .pagingController,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (_, activity, __) {
                          return ActivityBuilderWidget(
                            activity,
                            userId: widget.userId,
                          );
                        },
                        firstPageProgressIndicatorBuilder: (_) =>
                            const FirstPageProgressBuilder(),
                        newPageProgressIndicatorBuilder: (_) =>
                            const NewPageProgressBuilder(),
                        noItemsFoundIndicatorBuilder: (_) =>
                            const SizedBox.shrink(),
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                children: [
                  BlocBuilder<AlarmActivityBloc, AlarmActivityState>(
                    builder: (context, state) {
                      if (state is AlarmActivityLoadedState) {
                        return UserInfoAvatarWidget(
                          shortName: state.shortName,
                          color: UiUtils.colorFromString(state.displayName),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: BlocBuilder<AlarmActivityBloc, AlarmActivityState>(
                      builder: (context, state) {
                        if (state is AlarmCommentEditState) {
                          return AlarmEditCommentTextField(
                            state.commentId,
                            alarmId: state.alarmId,
                            commentToEdit: state.commentToEdit,
                          );
                        }

                        return AlarmCommentTextField(widget.alarmId);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
