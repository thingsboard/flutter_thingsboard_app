import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_list_card.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarms_card.dart';
import 'package:thingsboard_app/utils/ui/pagination_list_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_exception_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/new_page_progress_builder.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AlarmsList extends StatelessWidget {
  const AlarmsList({required this.tbContext, super.key});

  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          getIt<AlarmBloc>().add(const AlarmsRefreshPageEvent()),
      child: PaginationListWidget<AlarmQueryV2, AlarmInfo>(
        pagingController:
            getIt<AlarmBloc>().paginationRepository.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, alarm, index) {
            return EntityListCard(
              alarm,
              entityCardWidgetBuilder: (context, alarm) {
                return AlarmCard(
                  tbContext,
                  alarm: alarm,
                );
              },
              onEntityTap: (alarm) {
                final dashboardId = alarm.details?['dashboardId'];
                if (dashboardId == null) {
                  if (tbContext.tbClient.isTenantAdmin()) {
                    tbContext.showWarnNotification(
                      'Mobile dashboard should be configured in device profile alarm rules!',
                    );
                  }
                  return;
                }

                final hasPermission = tbContext.hasGenericPermission(
                      Resource.WIDGETS_BUNDLE,
                      Operation.READ,
                    ) &&
                    tbContext.hasGenericPermission(
                      Resource.WIDGET_TYPE,
                      Operation.READ,
                    );

                if (hasPermission) {
                  tbContext.navigateToDashboard(
                    dashboardId,
                    dashboardTitle: alarm.originatorName,
                    state: Utils.createDashboardEntityState(
                      alarm.originator,
                      entityName: alarm.originatorName,
                    ),
                  );
                } else {
                  tbContext.showErrorNotification(
                    'You don\'t have permissions to perform this operation!',
                  );
                }
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
          ),
        ),
      ),
    );
  }
}
