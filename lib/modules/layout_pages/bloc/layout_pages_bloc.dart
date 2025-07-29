import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thingsboard_app/config/routes/route_not_found_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
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
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_icon.dart';
import 'package:thingsboard_app/modules/url/url_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class LayoutPagesBloc extends Bloc<LayoutPagesEvent, LayoutPagesState> {
  LayoutPagesBloc({required this.layoutService, required this.tbContext})
    : super(const BottomBarLoadingState()) {
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
        await onBottomBarFetchEvent(event, emit);
      case BottomBarOrientationChangedEvent():
        layoutService.setDeviceScreenSize(
          event.screenSize,
          orientation: event.orientation,
        );
        emit(BottomBarDataState(items: layoutService.getBottomBarItems()));
    }
  }

  Future<void> onBottomBarFetchEvent(
    BottomBarFetchEvent event,
    Emitter emit,
  ) async {
    final items = layoutService.getCachedPageLayouts();
    layoutService.setBottomBarItems(
      items
          .map(
            (e) => TbMainNavigationItem(
              page: MainItemWidget(
                tbContext,
                path: e.path ?? '',
                child: getWidget(e),
              ),
              title: getLabel(e, event.context),
              icon: getIcon(e),
              path: getPath(e),
              showAdditionalIcon: e.id == Pages.notifications,
              additionalIconSmall:
                  e.id == Pages.notifications
                      ? notificationSmallNumberWidget()
                      : null,
              additionalIconLarge:
                  e.id == Pages.notifications
                      ? notificationLargeNumberWidget()
                      : null,
            ),
          )
          .toList(),
      more: TbMainNavigationItem(
        page: MainItemWidget(
          tbContext,
          path: '/more',
          child: MorePage(tbContext),
        ),
        title: S.of(event.context).more,
        icon: Icons.menu_outlined,
        path: '/more',
      ),
    );

    emit(BottomBarDataState(items: layoutService.getBottomBarItems()));
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
        if (pageLayout.dashboardId != null) {
          return SingleDashboardView(tbContext, id: pageLayout.dashboardId!);
        } else if (pageLayout.url != null) {
          return UrlPage(url: pageLayout.url!, tbContext: tbContext);
        } else if (pageLayout.path != null) {
          late String path;

          // Check if a user wants to open web view
          if (pageLayout.path!.startsWith('/url/')) {
            final link = Uri.encodeComponent(
              pageLayout.path!.split('/url/').last,
            );
            path = '${'/url'}/$link';
          } else {
            path = pageLayout.path!;
          }

          // Find the route by its path
          final match = tbContext.thingsboardAppRouter.router.match(path);
          if (match != null &&
              match.route.handler != null &&
              match.route.handler is Handler) {
            final Handler handler = match.route.handler as Handler;
            return handler.handlerFunc(null, match.parameters) ??
                RouteNotFoundWidget(settings: RouteSettings(name: path));
          }
        }

        return const SizedBox.shrink();
    }
  }

  String getLabel(PageLayout pageLayout, BuildContext context) {
    if (pageLayout.label != null) {
      return pageLayout.label!;
    }

    switch (pageLayout.id) {
      case Pages.home:
        return S.of(context).home;
      case Pages.alarms:
        return S.of(context).alarms(2);
      case Pages.devices:
        return S.of(context).devices(2);
      case Pages.customers:
        return S.of(context).customers;
      case Pages.assets:
        return S.of(context).assets;
      case Pages.audit_logs:
        return S.of(context).auditLogs;
      case Pages.notifications:
        return S.of(context).notifications(2);
      case Pages.device_list:
        return S.of(context).deviceList;
      case Pages.dashboards:
        return S.of(context).dashboards(2);
      case Pages.undefined:
      case null:
        return pageLayout.label ?? '-';
    }
  }

  IconData getIcon(PageLayout pageLayout) {
    if (pageLayout.icon != null) {
      return getIconFromString(pageLayout.icon);
    }

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
        return getIconFromString(pageLayout.icon);
    }
  }

  String getPath(PageLayout pageLayout) {
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
        } else if (pageLayout.path?.startsWith('/url/') == true) {
          return '/url/${Uri.encodeComponent(pageLayout.path!.split('/url/').last)}';
        }

        return pageLayout.path ?? 'something went wrong';
    }
  }

  IconData getIconFromString(String? icon) {
    if (icon != null) {
      if (icon.contains('mdi')) {
        // translate-me-ignore-next-line
        return MdiIcons.fromString(icon.split('mdi:').last) ??
            Icons.error_outline;
      }

      return materialIconsMap[icon] ?? Icons.error_outline;
    }

    return Icons.error_outline;
  }

  Widget notificationSmallNumberWidget() {
    return StreamBuilder<int>(
      stream: NotificationsLocalService.notificationsNumberStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            alignment: Alignment.center,
            height: 8,
            width: 8,
          );
        }

        return const SizedBox(width: 8, height: 8);
      },
    );
  }

  Widget notificationLargeNumberWidget() {
    return StreamBuilder<int>(
      stream: NotificationsLocalService.notificationsNumberStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            alignment: Alignment.center,
            height: 18,
            width: 18,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '${snapshot.data! > 99 ? '99+' : snapshot.data}',
                textAlign: TextAlign.center,
                style: TbTextStyles.labelSmall.copyWith(color: Colors.white),
              ),
            ),
          );
        }

        return const SizedBox(width: 18, height: 18);
      },
    );
  }
}
