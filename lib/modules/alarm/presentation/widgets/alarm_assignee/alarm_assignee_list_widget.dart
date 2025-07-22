import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/alarm_assignee_pagiation_repository.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_state.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/tb_error_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/string_utils.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class AlarmAssigneeListWidget extends StatefulWidget {
  const AlarmAssigneeListWidget({required this.tbContext, super.key});

  final TbContext tbContext;

  @override
  State<StatefulWidget> createState() => _AssigneeListWidgetState();
}

class _AssigneeListWidgetState extends State<AlarmAssigneeListWidget> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xffC7C7CC).withValues(alpha: .5),
              ),
              width: 36,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).users,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).cancel),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  hintStyle: TbTextStyles.bodyLarge.copyWith(
                    color: Colors.black.withValues(alpha: .38),
                  ),
                  hintText: S.of(context).searchUsers(1),
                  contentPadding: const EdgeInsets.fromLTRB(8, 12, 16, 12),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withValues(alpha: 0.54),
                    size: 24,
                  ),
                  suffixIcon:
                      textEditingController.text.isNotEmpty
                          ? IconButton(
                            onPressed: () {
                              context.read<AlarmAssigneeBloc>().add(
                                const AlarmAssigneeResetSearchTextEvent(),
                              );
                              setState(() {
                                textEditingController.clear();
                              });
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.black.withValues(alpha: .54),
                              size: 24,
                            ),
                          )
                          : null,
                ),
                onChanged: (text) {
                  context.read<AlarmAssigneeBloc>().add(
                    AlarmAssigneeSearchEvent(searchText: text),
                  );
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: PagedListView<UsersAssignQuery, AssigneeEntity>.separated(
                pagingController:
                    getIt<AlarmAssigneePaginationRepository>().pagingController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shrinkWrap: true,
                builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) {
                    final state = context.read<AlarmAssigneeBloc>().state;
                    Widget? userInfoWidget;

                    if (state is AlarmAssigneeSelectedState) {
                      final selectedId = state.assignee.userInfo.id.id;
                      if (selectedId == item.userInfo.id.id) {
                        userInfoWidget = const SizedBox.shrink();
                      }
                    }

                    return Column(
                      children: [
                        Visibility(
                          visible:
                              index == 0 && state is AlarmAssigneeSelectedState,
                          child: Column(
                            children: [
                              UserInfoWidget(
                                avatar: Icon(
                                  Icons.account_circle,
                                  color: Colors.black.withValues(alpha: 0.38),
                                  size: 32,
                                ),
                                name: S.of(context).unassigned,
                                onUserTap: (id) {
                                  Navigator.of(context).pop();
                                  context.read<AlarmAssigneeBloc>().add(
                                    const AlarmAssigneeUnassignedEvent(),
                                  );
                                },
                                id:
                                    widget.tbContext.tbClient
                                        .getAuthUser()!
                                        .userId!,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                        userInfoWidget ??
                            UserInfoWidget(
                              avatar: UserInfoAvatarWidget(
                                shortName: item.shortName,
                                color:
                                    HSLColor.fromAHSL(
                                      1,
                                      item.displayName.hashCode % 360,
                                      40 / 100,
                                      60 / 100,
                                    ).toColor(),
                              ),
                              name: item.displayName,
                              email: item.userInfo.email,
                              showEmail: !item.displayName.isValidEmail(),
                              searchText: textEditingController.text,
                              onUserTap: (id) {
                                Navigator.of(context).pop();
                                context.read<AlarmAssigneeBloc>().add(
                                  AlarmAssigneeSelectedEvent(id),
                                );
                              },
                              id: item.userInfo.id.id!,
                            ),
                      ],
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) {
                    return Container(
                      height: 200,
                      color: const Color(0x99FFFFFF),
                      child: const Center(
                        child: TbProgressIndicator(size: 50.0),
                      ),
                    );
                  },
                  noItemsFoundIndicatorBuilder: (_) {
                    return Column(
                      children: [
                        const SizedBox(height: 72),
                        Text(
                          S.of(context).noResultsFound,
                          style: TbTextStyles.titleXs.copyWith(
                            color: Colors.black.withValues(alpha: .87),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          S.of(context).tryRefiningYourQuery,
                          style: TbTextStyles.bodyLarge.copyWith(
                            color: Colors.black.withValues(alpha: .54),
                          ),
                        ),
                      ],
                    );
                  },
                  firstPageErrorIndicatorBuilder: (_) {
                    return TbErrorWidget(
                      onRefresh:
                          () => context.read<AlarmAssigneeBloc>().add(
                            const AlarmAssigneeRefreshEvent(),
                          ),
                    );
                  },
                ),
                separatorBuilder: (_, _) {
                  return const SizedBox(height: 16);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.clear();
    super.dispose();
  }
}
