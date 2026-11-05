import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/main/model/navigation_item_data.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_icon.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/thingsboard_client_extensions.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';

/// Paths of the More and Profile items the app adds to the bottom bar.
const morePath = '/more';
const fullScreenProfile = '/profile?fullscreen=true';

class NavigationHelper {
  /// A title set in the bundle layout wins over the localized default, so an
  /// admin's renamed page shows as typed regardless of the device language.
  static String getLocalizedTitle(
    BuildContext context,
    NavigationItemData item,
  ) {
    if (item.label case final label?) return label;
    final s = S.of(context);
    if (item.path == morePath) return s.more;
    if (item.path == fullScreenProfile) return s.profile;
    // Exhaustive over Pages, so a new built-in page fails to compile until it
    // gets a localized title here.
    return switch (Pages.values.asNameMap()[item.id]) {
      Pages.home => s.home,
      Pages.alarms => s.alarms(2),
      Pages.devices => s.devices(2),
      Pages.customers => s.customers,
      Pages.assets => s.assets,
      Pages.audit_logs => s.auditLogs,
      Pages.notifications => s.notifications(2),
      Pages.device_list => s.deviceList,
      Pages.dashboards => s.dashboards(2),
      Pages.live_location_tracking => s.liveTrackingMenuTitle,
      Pages.undefined || null => item.title,
    };
  }

  static int? getCurrentIndexFromPath(
    String path,
    List<NavigationItemData> items,
  ) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].path == path) {
        return i;
      }
    }
    return null;
  }

  /// The title typed for the page in the bundle layout, or null when it was
  /// left at the default or saved blank.
  static String? customLabel(PageLayout pageLayout) {
    final label = pageLayout.label;
    if (label == null || label.trim().isEmpty) {
      return null;
    }
    return label;
  }

  /// The navigation item for a page from the bundle layout. Keeps the custom
  /// label separate from the default title, so the title can be localized.
  static NavigationItemData toNavigationItem(PageLayout pageLayout) {
    return NavigationItemData(
      title: getLabel(pageLayout),
      icon: getIcon(pageLayout),
      path: getPath(pageLayout),
      id: pageLayout.id?.name,
      label: customLabel(pageLayout),
      showNotificationBadge: pageLayout.id == Pages.notifications,
    );
  }

  // Helper functions
  static String getLabel(PageLayout pageLayout) {
    final label = customLabel(pageLayout);
    if (label != null) {
      return label;
    }

    switch (pageLayout.id) {
      case Pages.home:
        return 'Home';
      case Pages.alarms:
        return 'Alarms';
      case Pages.devices:
        return 'Devices';
      case Pages.customers:
        return 'Customers';
      case Pages.assets:
        return 'Assets';
      case Pages.audit_logs:
        return 'Audit Logs';
      case Pages.notifications:
        return 'Notifications';
      case Pages.device_list:
        return 'Device List';
      case Pages.dashboards:
        return 'Dashboards';
      case Pages.live_location_tracking:
        return 'Live location tracking';
      case Pages.undefined:
      case null:
        return pageLayout.label ?? '-';
    }
  }

  /// SYS_ADMIN is not RBAC-filtered: see [_isAllowedForSysAdmin]. For everyone
  /// else this mirrors the web UI's `menuFilters` (PE ui-ngx
  /// `src/app/core/services/menu.models.ts`): a page is visible only if the
  /// user can read its underlying resource, either generically or via group
  /// roles.
  ///
  /// `userPermissions` is only null before `loadUser()` has completed (it is
  /// published together with `mobileLoginInfo`), so the null branch fails open
  /// on purpose: a permissions hiccup must not lock the user out of navigation.
  /// This differs from `LoginState.hasGenericPermission`, which fails closed
  /// because it guards actions rather than menu entries.
  static bool isPageVisible(PageLayout pageLayout, LoginState login) {
    if (login.userScope == Authority.SYS_ADMIN) {
      return _isAllowedForSysAdmin(pageLayout);
    }
    final permissions = login.userPermissions;
    if (permissions == null) {
      return true;
    }
    switch (pageLayout.id) {
      case Pages.alarms:
        return permissions.hasReadGenericPermission(Resource.ALARM);
      case Pages.devices:
        // The Devices grid is backed by `/api/deviceProfileInfos`, which the
        // server gates on generic DEVICE_PROFILE read even for customer users,
        // so DEVICE permissions alone would only lead to a 403 here.
        return permissions.hasReadGenericPermission(Resource.DEVICE_PROFILE);
      case Pages.device_list:
        return permissions.hasReadGenericOrSharedGroupsPermission(
          Resource.DEVICE,
          EntityType.DEVICE,
        );
      case Pages.assets:
        return permissions.hasReadGenericOrSharedGroupsPermission(
          Resource.ASSET,
          EntityType.ASSET,
        );
      case Pages.customers:
        return permissions.hasReadGenericOrSharedGroupsPermission(
          Resource.CUSTOMER,
          EntityType.CUSTOMER,
        );
      case Pages.dashboards:
        return permissions.hasReadGenericOrSharedGroupsPermission(
          Resource.DASHBOARD,
          EntityType.DASHBOARD,
        );
      case Pages.audit_logs:
        return permissions.hasReadGenericPermission(Resource.AUDIT_LOG);
      case Pages.home:
      case Pages.notifications:
      // The live tracking page only reports the device's own tracking session,
      // so there is no server resource to gate it on; the entity write it
      // performs is authorized per fix by the save call itself.
      case Pages.live_location_tracking:
      case Pages.undefined:
      case null:
        return true;
    }
  }

  /// SYS_ADMIN's generic permissions don't reflect what the tenant endpoints
  /// allow (they answer 403), so only the built-in pages served to sysadmins
  /// are allowed, plus custom pages the sysadmin configured. A built-in page id
  /// this app version doesn't know also parses to [Pages.undefined]; it has no
  /// target to open, so it is hidden.
  static bool _isAllowedForSysAdmin(PageLayout pageLayout) {
    switch (pageLayout.id) {
      case Pages.home:
      case Pages.notifications:
      case Pages.audit_logs:
        return true;
      case Pages.undefined:
      case null:
        return pageLayout.url != null ||
            pageLayout.dashboardId != null ||
            pageLayout.path != null;
      case Pages.alarms:
      case Pages.devices:
      case Pages.customers:
      case Pages.assets:
      case Pages.device_list:
      case Pages.dashboards:
      case Pages.live_location_tracking:
        return false;
    }
  }

  static IconData getIcon(PageLayout pageLayout) {
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
        return Icons.supervisor_account_sharp;
      case Pages.assets:
        return Icons.domain_outlined;
      case Pages.audit_logs:
        return Icons.track_changes_outlined;
      case Pages.notifications:
        return Icons.notifications_active_sharp;
      case Pages.device_list:
        return Icons.devices;
      case Pages.dashboards:
        return Icons.dashboard_outlined;
      case Pages.live_location_tracking:
        return Icons.my_location;
      case Pages.undefined:
      case null:
        return getIconFromString(pageLayout.icon);
    }
  }

  static String getPath(PageLayout pageLayout) {
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
      case Pages.live_location_tracking:
        return '/liveTracking';
      case Pages.undefined:
      case null:
        if (pageLayout.url != null) {
          return '/url/${Uri.encodeComponent(pageLayout.url!)}';
        } else if (pageLayout.dashboardId != null) {
          return '/dashboard/${pageLayout.dashboardId}';
        } else if (pageLayout.path?.startsWith('/url/') == true) {
          return '/url/${Uri.encodeComponent(pageLayout.path!.split('/url/').last)}';
        }

        return pageLayout.path ?? '/error';
    }
  }

  static IconData getIconFromString(String? icon) {
    if (icon != null) {
      if (icon.contains('mdi')) {
        return MdiIcons.fromString(icon.split('mdi:').last) ??
            Icons.error_outline;
      }

      return materialIconsMap[icon] ?? Icons.error_outline;
    }
    return Icons.error_outline;
  }
}
