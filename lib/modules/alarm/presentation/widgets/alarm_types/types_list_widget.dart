import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).alarmTypes,
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
            Flexible(
              child: PagedListView<PageLink, AlarmType>.separated(
                pagingController: getIt<AlarmTypesBloc>()
                    .paginationRepository
                    .pagingController,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          Flexible(
                            child: Text(
                              item.type,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                separatorBuilder: (_, _) =>
                    const Divider(thickness: 1, height: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
