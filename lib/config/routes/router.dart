import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

class ThingsboardAppRouter {
  ThingsboardAppRouter({required this.overlayService});

  final IOverlayService overlayService;
  final TbLogger log = getIt<TbLogger>();

  BuildContext? get context => globalNavigatorKey.currentContext;
  Future<T?> navigateTo<T>(
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool closeDashboard = true,
    TransitionType? transition,
    Duration? transitionDuration,
    bool restoreDashboard = true,
    RouteSettings? routeSettings,
  }) async {
    overlayService.hideNotification();
    final mapArgs = routeSettings?.arguments as Map<String, dynamic>?;
    String query = '';
    if (mapArgs != null) {
      query = mapArgs.entries.map((e) => '${e.key}=${e.value}').join('&');
    }
    final result = await context?.push(
      '$path${query.isEmpty ? query : '?$query'}',
    );
    return result as T?;
  }

  Future<void> pop<T>([T? result, BuildContext? context]) async {
    final targetContext = context ?? this.context;

    targetContext?.pop<T>(result);
  }

  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  }) async {
    context?.push(
      '/dashboard',
      extra: DashboardArgumentsEntity(
        id: dashboardId,
        title: dashboardTitle,
        state: state,
        hideToolbar: hideToolbar,
        animate: animate,
      ),
    );
  }

  Future<void> navigateByAppLink(String? link) async {
    if (link != null) {
      final uri = Uri.parse(link);
      await getIt<ILocalDatabaseService>().deleteInitialAppLink();
      log.debug('TbContext: navigate by appLink $uri');
      navigateTo(
        uri.path,
        routeSettings: RouteSettings(
          arguments: {...uri.queryParameters, 'uri': uri},
        ),
      );
    }
  }
}
