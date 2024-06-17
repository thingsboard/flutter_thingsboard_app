import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/user_info_widget.dart';
import 'package:thingsboard_app/utils/string_utils.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AlarmAssigneeFilter extends StatelessWidget {
  const AlarmAssigneeFilter({required this.tbContext, super.key});

  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: 'Assignee',
      child: BlocBuilder<AssigneeBloc, AssigneeState>(
        builder: (context, state) {
          if (state is AssigneeEmptyState) {
            return InkWell(
              onTap: () {
                showBarModalBottomSheet(
                  context: context,
                  bounce: true,
                  builder: (context) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Done'),
                          ),
                        ),
                        Flexible(
                          child:
                              PagedListView<PageLink, AssigneeEntity>.separated(
                            pagingController: getIt<AssigneeBloc>()
                                .paginationRepository
                                .pagingController,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            builderDelegate: PagedChildBuilderDelegate(
                              itemBuilder: (context, item, index) {
                                return Column(
                                  children: [
                                    Visibility(
                                      visible: index == 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 16,
                                        ),
                                        child: UserInfoWidget(
                                          avatar: Icon(
                                            Icons.account_circle,
                                            color:
                                                Colors.black.withOpacity(0.38),
                                          ),
                                          name: 'Assigned to me',
                                          onUserTap: (id) {
                                            Navigator.of(context).pop();
                                          },
                                          id: tbContext.tbClient
                                              .getAuthUser()!
                                              .userId!,
                                        ),
                                      ),
                                    ),
                                    UserInfoWidget(
                                      avatar: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: HSLColor.fromAHSL(
                                            1,
                                            item.displayName.hashCode % 360,
                                            40 / 100,
                                            60 / 100,
                                          ).toColor(),
                                        ),
                                        height: 24,
                                        width: 24,
                                        child: Center(
                                          child: Text(
                                            item.shortName,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      name: item.displayName,
                                      email: item.userInfo.email,
                                      showEmail:
                                          !item.displayName.isValidEmail(),
                                      onUserTap: (id) {
                                        Navigator.of(context).pop();
                                      },
                                      id: item.userInfo.id.id!,
                                    ),
                                  ],
                                );
                              },
                              firstPageProgressIndicatorBuilder: (_) {
                                return SizedBox.expand(
                                  child: Container(
                                    color: const Color(0x99FFFFFF),
                                    child: Center(
                                      child: TbProgressIndicator(
                                        tbContext,
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            separatorBuilder: (_, __) =>
                                const Divider(thickness: 1),
                          ),
                        ),
                      ],
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
                child: Row(
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
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
