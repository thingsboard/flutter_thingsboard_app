import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_page.dart';
import 'package:thingsboard_app/modules/asset/assets_page.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_page.dart';
import 'package:thingsboard_app/modules/customer/customers_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/single_dashboard_view.dart';
import 'package:thingsboard_app/modules/device/devices_list_page.dart';
import 'package:thingsboard_app/modules/device/devices_main_page.dart';
import 'package:thingsboard_app/modules/home/home_page.dart';
import 'package:thingsboard_app/modules/layout_pages/bloc/bloc.dart';
import 'package:thingsboard_app/modules/main/main_item_widget.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/modules/more/more_page.dart';
import 'package:thingsboard_app/modules/notification/notification_page.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_icon.dart';
import 'package:thingsboard_app/modules/url/url_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';

class LayoutPagesBloc extends Bloc<LayoutPagesEvent, LayoutPagesState> {
  LayoutPagesBloc({
    required this.layoutService,
    required this.tbContext,
  }) : super(const BottomBarLoadingState()) {
    on(_onEvent);
  }

  final ILayoutService layoutService;
  final TbContext tbContext;

  Future<void> _onEvent(
    LayoutPagesEvent event,
    Emitter<LayoutPagesState> emit,
  ) async {
    switch (event) {
      case BottomBarFetchEvent():
        final items = layoutService.getCachedPageLayouts();

        layoutService.setBottomBarItems(
          items
              .map(
                (e) => TbMainNavigationItem(
                  page: MainItemWidget(
                    getWidget(e),
                    path: e.path ?? '',
                  ),
                  title: getLabel(e, event.context),
                  icon: getIcon(e),
                  path: getPath(e),
                ),
              )
              .toList(),
          more: TbMainNavigationItem(
            page: MainItemWidget(
              MorePage(tbContext),
              path: '/more',
            ),
            title: S.of(event.context).more,
            icon: Icons.menu_outlined,
            path: '/more',
          ),
        );

        emit(BottomBarDataState(items: layoutService.getBottomBarItems()));
        break;
      case BottomBarOrientationChangedEvent():
        emit(BottomBarDataState(items: layoutService.getBottomBarItems()));

        break;
    }
  }

  Widget getWidget(PageLayout pageLayout) {
    switch (pageLayout.id) {
      case Pages.home:
        return HomePage(tbContext);
      case Pages.alarms:
        return AlarmsPage(tbContext);
      case Pages.devices:
        return DevicesMainPage(tbContext);
      case Pages.customers:
        return CustomersPage(tbContext);
      case Pages.assets:
        return AssetsPage(tbContext);
      case Pages.audit_logs:
        return AuditLogsPage(tbContext);
      case Pages.notifications:
        return NotificationPage(tbContext);
      case Pages.device_list:
        return DevicesListPage(tbContext);
      case Pages.dashboards:
        return DashboardsPage(tbContext);
      case Pages.undefined:
      case null:
        if (pageLayout.path != null) {
          // Find the route by its path
          final match = tbContext.router.match(pageLayout.path!);
          if (match != null && match.route.handler != null) {
            // Execute the handler's function to retrieve the widget
            return match.route.handler?.handlerFunc(null, match.parameters);
          }
        } else if (pageLayout.url != null) {
          return UrlPage(url: pageLayout.url!, tbContext: tbContext);
        } else if (pageLayout.dashboardId != null) {
          return SingleDashboardView(tbContext, id: pageLayout.dashboardId!);
        }

        return const SizedBox.shrink();
    }
  }

  String getLabel(PageLayout pageLayout, BuildContext context) {
    switch (pageLayout.id) {
      case Pages.home:
        return S.of(context).home;
      case Pages.alarms:
        return S.of(context).alarms;
      case Pages.devices:
        return S.of(context).devices;
      case Pages.customers:
        return S.of(context).customers;
      case Pages.assets:
        return S.of(context).assets;
      case Pages.audit_logs:
        return S.of(context).auditLogs;
      case Pages.notifications:
        return S.of(context).notifications;
      case Pages.device_list:
        return S.of(context).deviceList;
      case Pages.dashboards:
        return S.of(context).dashboards;
      case Pages.undefined:
      case null:
        return pageLayout.label ?? '-';
    }
  }

  IconData getIcon(PageLayout pageLayout) {
    switch (pageLayout.id) {
      case Pages.home:
        return Icons.home_outlined;
      case Pages.alarms:
        return Icons.notifications_outlined;
      case Pages.devices:
        return Icons.devices_other_outlined;
      case Pages.customers:
        return Icons.supervisor_account_outlined;
      case Pages.assets:
        return Icons.domain_outlined;
      case Pages.audit_logs:
        return Icons.track_changes_outlined;
      case Pages.notifications:
        return Icons.notifications_active_outlined;
      case Pages.device_list:
        return Icons.devices;
      case Pages.dashboards:
        return Icons.dashboard_outlined;
      case Pages.undefined:
      case null:
        if (pageLayout.icon != null) {
          if (pageLayout.icon!.contains('mdi')) {
            return MdiIcons.fromString(pageLayout.icon!.split('mdi:').last) ??
                Icons.error_outline;
          }

          return materialIconsMap[pageLayout.icon] ?? Icons.error_outline;
        }

        return Icons.error_outline;
    }
  }

  String getPath(PageLayout pageLayout) {
    if (pageLayout.path != null) {
      return pageLayout.path!;
    }

    switch (pageLayout.id) {
      case Pages.home:
        return '/home';
      case Pages.alarms:
        return '/alarms';
      case Pages.devices:
        return '/devices';
      case Pages.customers:
        return '/customers';
      case Pages.assets:
        return '/assets';
      case Pages.audit_logs:
        return '/auditLogs';
      case Pages.notifications:
        return '/notifications';
      case Pages.device_list:
        return '/deviceList';
      case Pages.dashboards:
        return '/dashboards';
      case Pages.undefined:
      case null:
        if (pageLayout.url != null) {
          return '/url/${Uri.encodeComponent(pageLayout.url!)}';
        } else if (pageLayout.dashboardId != null) {
          return '/dashboard/${pageLayout.dashboardId}';
        }
        return pageLayout.path ?? 'something went wrong';
    }
  }
}
