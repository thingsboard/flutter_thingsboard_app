import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entity_grid_card.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_page_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_grid_card.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/permission/i_permission_service.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_exception_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/new_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/pagination_grid_widget.dart';

class DashboardsGridWidget extends StatelessWidget {
  const DashboardsGridWidget({
    required this.tbContext,
    required this.dashboardPageCtrl,
    super.key,
  });

  final TbContext tbContext;
  final DashboardPageController dashboardPageCtrl;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getIt<DashboardsPaginationRepository>().refresh();
      },
      child: PaginationGridWidget<PageLink, DashboardInfo>(
        pagingController:
            getIt<DashboardsPaginationRepository>().pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) => EntityGridCard(
            item,
            entityCardWidgetBuilder: (_, dashboard) => DashboardGridCard(
              tbContext,
              dashboard: dashboard,
            ),
            onEntityTap: (dashboard) {
              tbContext.navigateToDashboard(
                dashboard.id!.id!,
                dashboardTitle: dashboard.title,
              );
              return;

              final havePermission = getIt<IPermissionService>()
                  .haveViewDashboardPermission(tbContext);

              if (havePermission) {
                dashboardPageCtrl.openDashboard(
                  dashboard.id!.id!,
                  title: dashboard.title,
                );
              } else {
                tbContext.showErrorNotification(
                  'You don\'t have permissions to perform this operation!',
                );
              }
            },
            settings: EntityCardSettings(dropShadow: true),
          ),
          firstPageProgressIndicatorBuilder: (_) =>
              const FirstPageProgressBuilder(),
          newPageProgressIndicatorBuilder: (_) =>
              const NewPageProgressBuilder(),
          noItemsFoundIndicatorBuilder: (context) =>
              FirstPageExceptionIndicator(
            title: 'No dashboards found',
            message: S.of(context).listIsEmptyText,
            onTryAgain: () {
              getIt<DashboardsPaginationRepository>()
                  .pagingController
                  .refresh();
            },
          ),
        ),
      ),
    );
  }
}
