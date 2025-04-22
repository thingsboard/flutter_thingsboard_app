import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/entity/entity_list_card.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/alarms_card.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/pagination_list_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_exception_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/new_page_progress_builder.dart';

class AlarmsList extends StatelessWidget {
  const AlarmsList({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => getIt<AlarmBloc>().add(
        const AlarmsRefreshPageEvent(),
      ),
      child: PaginationListWidget<AlarmQueryV2, AlarmInfo>(
        pagingController:
            getIt<AlarmBloc>().paginationRepository.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, alarm, index) {
            return EntityListCard(
              alarm,
              entityCardWidgetBuilder: (_, alarm) {
                return AlarmCard(alarm: alarm);
              },
            );
          },
          firstPageProgressIndicatorBuilder: (_) =>
              const FirstPageProgressBuilder(),
          newPageProgressIndicatorBuilder: (_) =>
              const NewPageProgressBuilder(),
          noItemsFoundIndicatorBuilder: (context) =>
              FirstPageExceptionIndicator(
            title: 'No alarms found',
            message: S.of(context).listIsEmptyText,
            onTryAgain: () => getIt<AlarmBloc>().add(
              const AlarmsRefreshPageEvent(),
            ),
          ),
        ),
      ),
    );
  }
}
