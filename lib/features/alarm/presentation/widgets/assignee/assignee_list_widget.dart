import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/features/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/assignee/assignee_event.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/assignee/assignee_state.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/user_info_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/string_utils.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class AssigneeListWidget extends StatelessWidget {
  const AssigneeListWidget({
    required this.onChanged,
    super.key,
  });

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7 +
            MediaQuery.of(context).viewInsets.bottom,
        minHeight: MediaQuery.of(context).size.height * 0.3 +
            MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).assignee,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.12),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.38),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          hintText: 'Search users',
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          isDense: true,
                        ),
                        onChanged: (text) {
                          getIt<AssigneeBloc>().add(
                            AssigneeSearchEvent(searchText: text),
                          );
                        },
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black.withValues(alpha: 0.54),
                      size: 24,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Flexible(
                child: PagedListView<PageLink, AssigneeEntity>.separated(
                  pagingController: getIt<AssigneeBloc>()
                      .paginationRepository
                      .pagingController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shrinkWrap: true,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) {
                      final state = getIt<AssigneeBloc>().state;
                      Widget? userInfoWidget;

                      if (state is AssigneeSelectedState) {
                        final selectedId = state.assignee.userInfo.id.id;
                        if (selectedId == item.userInfo.id.id) {
                          userInfoWidget = const SizedBox.shrink();
                        }
                      }

                      return Column(
                        children: [
                          Visibility(
                            visible: index == 0 &&
                                state is! AssigneeSelfAssignmentState,
                            child: Column(
                              children: [
                                UserInfoWidget(
                                  avatar: Icon(
                                    Icons.account_circle,
                                    color: Colors.black.withOpacity(0.38),
                                    size: 32,
                                  ),
                                  name: 'Assigned to me',
                                  onUserTap: (id) {
                                    Navigator.of(context).pop();
                                    getIt<AssigneeBloc>().add(
                                      AssigneeSelectedEvent(
                                        userId: id,
                                        selfAssignment: true,
                                      ),
                                    );

                                    onChanged();
                                  },
                                  id: getIt<ITbClientService>()
                                      .getAuthUser()!
                                      .userId!,
                                ),
                                const Divider(thickness: 1, height: 32),
                              ],
                            ),
                          ),
                          userInfoWidget ??
                              UserInfoWidget(
                                avatar: UserInfoAvatarWidget(
                                  shortName: item.shortName,
                                  color: HSLColor.fromAHSL(
                                    1,
                                    item.displayName.hashCode % 360,
                                    40 / 100,
                                    60 / 100,
                                  ).toColor(),
                                ),
                                name: item.displayName,
                                email: item.userInfo.email,
                                showEmail: !item.displayName.isValidEmail(),
                                onUserTap: (id) {
                                  Navigator.of(context).pop();
                                  getIt<AssigneeBloc>().add(
                                    AssigneeSelectedEvent(userId: id),
                                  );

                                  onChanged();
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
                  ),
                  separatorBuilder: (_, index) {
                    final state = getIt<AssigneeBloc>().state;

                    if (state is AssigneeSelectedState) {
                      final selectedId = state.assignee.userInfo.id.id;
                      final userId = getIt<AssigneeBloc>()
                          .paginationRepository
                          .pagingController
                          .itemList?[index];
                      if (selectedId == userId?.userInfo.id.id) {
                        return const SizedBox.shrink();
                      }
                    }

                    return const Divider(thickness: 1, height: 24);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
