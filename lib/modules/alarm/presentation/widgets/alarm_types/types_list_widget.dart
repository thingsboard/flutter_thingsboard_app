import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/bloc.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class TypesListWidget extends StatelessWidget {
  const TypesListWidget({
    required this.tbContext,
    required this.onChanged,
    super.key,
  });

  final TbContext tbContext;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ),
            Flexible(
              child: PagedListView<PageLink, AlarmType>.separated(
                pagingController: getIt<AlarmTypesBloc>()
                    .paginationRepository
                    .pagingController,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                        getIt<AlarmTypesBloc>().add(
                          AlarmTypesSelectedEvent(type: item.type),
                        );
                        onChanged();
                      },
                      child: Row(
                        children: [
                          Text(item.type),
                        ],
                      ),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) {
                    return Container(
                      height: 200,
                      color: const Color(0x99FFFFFF),
                      child: Center(
                        child: TbProgressIndicator(
                          tbContext,
                          size: 50.0,
                        ),
                      ),
                    );
                  },
                ),
                separatorBuilder: (_, __) => const Divider(
                  thickness: 1,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
