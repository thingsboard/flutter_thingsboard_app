import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';
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
                    child: PagedListView<PageLink, UserInfo>.separated(
                      pagingController: getIt<AssigneeBloc>()
                          .paginationRepository
                          .pagingController,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, item, index) {
                          return Text(item.id.id ?? '-');
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
                      separatorBuilder: (_, __) => const Divider(thickness: 1),
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
                // child: Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 12),
                //     child: Text(
                //       'All',
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w400,
                //         color: Colors.black.withOpacity(0.38),
                //       ),
                //     ),
                //   ),
                // ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
