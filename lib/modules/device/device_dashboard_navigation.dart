import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_profile/device_profile_cache.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/utils.dart';

/// Opens the dashboard configured in a device's profile.
///
/// Shared by every place a device tap resolves to that dashboard, so the
/// PE permission gate — the dashboard cannot render its widgets without READ
/// on widget bundles and widget types — and the tenant-admin "no dashboard
/// configured" warning stay in one place instead of drifting between callers.
///
/// Pass [replace] to swap the current route for the dashboard rather than
/// pushing on top of it.
Future<void> openDeviceProfileDashboard(
  WidgetRef ref, {
  required EntityId? deviceId,
  required String deviceType,
  String? deviceName,
  String? deviceLabel,
  bool replace = false,
}) async {
  final tbClient = getIt<ITbClientService>().client;
  final profile = await DeviceProfileCache.getDeviceProfileInfo(
    tbClient,
    deviceType,
    deviceId?.id ?? '',
  );
  final loginInfo = ref.read(loginProvider);
  final dashboardId = profile.info.defaultDashboardId?.id;
  if (dashboardId == null || !loginInfo.isFullyAuthenticated()) {
    if (tbClient.isTenantAdmin()) {
      getIt<IOverlayService>().showWarnNotification(
        (context) =>
            S.of(context).mobileDashboardShouldBeConfiguredInDeviceProfile,
      );
    }
    return;
  }
  if (!loginInfo.hasGenericPermission(
        Resource.WIDGETS_BUNDLE,
        Operation.READ,
      ) ||
      !loginInfo.hasGenericPermission(Resource.WIDGET_TYPE, Operation.READ)) {
    getIt<IOverlayService>().showErrorNotification(
      (context) => S.of(context).youDontHavePermissionsToPerformThisOperation,
    );
    return;
  }
  final arguments = DashboardArgumentsEntity(
    id: dashboardId,
    title: deviceName,
    state: Utils.createDashboardEntityState(
      deviceId,
      entityName: deviceName,
      entityLabel: deviceLabel,
    ),
    hideToolbar: false,
    animate: false,
  );
  final context = globalNavigatorKey.currentContext;
  if (context == null) {
    return;
  }
  if (replace) {
    context.pushReplacement(DashboardRoutes.dashboard, extra: arguments);
  } else {
    context.push(DashboardRoutes.dashboard, extra: arguments);
  }
}
