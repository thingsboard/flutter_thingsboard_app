import 'package:fluro/fluro.dart' show FluroRouter, TransitionType;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/features/dashboard/domain/entites/dashboard_arguments.dart'
    show DashboardArgumentsEntity;

extension BuildContextExtension on BuildContext {
  Future<void> alert({
    required String title,
    required String message,
    String ok = 'Ok',
  }) {
    return showDialog<bool>(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(this).pop(),
            child: Text(ok),
          ),
        ],
      ),
    );
  }

  Future<bool?> confirm({
    required String title,
    required String message,
    String? cancel,
    String ok = 'Ok',
  }) {
    return showDialog<bool>(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(this).pop(false),
            child: Text(cancel ?? S.of(this).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(this).pop(true),
            child: Text(ok),
          ),
        ],
      ),
    );
  }

  Future<T?> showFullScreenDialog<T>(Widget dialog) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute<T>(
        builder: (BuildContext context) {
          return dialog;
        },
        fullscreenDialog: true,
      ),
    );
  }

  Future<dynamic> navigateTo(
    String path, {
    bool replace = false,
    bool clearStack = false,
    TransitionType? transition,
    Duration? transitionDuration,
    RouteSettings? routeSettings,
  }) async {
    if (transition != TransitionType.nativeModal) {
      transition = TransitionType.none;
    } else if (transition == null) {
      if (replace) {
        transition = TransitionType.fadeIn;
      } else {
        transition = TransitionType.native;
      }
    }

    return await FluroRouter.appRouter.navigateTo(
      this,
      path,
      transition: transition,
      transitionDuration: transitionDuration,
      replace: replace,
      clearStack: clearStack,
      routeSettings: routeSettings,
    );
  }

  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  }) async {
    return FluroRouter.appRouter.navigateTo(
      this,
      '/dashboard',
      routeSettings: RouteSettings(
        arguments: DashboardArgumentsEntity(
          dashboardId,
          title: dashboardTitle,
          state: state,
          hideToolbar: hideToolbar,
          animate: animate,
        ),
      ),
    );
  }

  Future<void> navigateByAppLink(String? link) async {
    if (link != null) {
      final uri = Uri.parse(link);
      navigateTo(
        uri.path,
        routeSettings: RouteSettings(
          arguments: {...uri.queryParameters, 'uri': uri},
        ),
      );
    }
  }

  Future<void> pop<T>([T? result]) async {
    return FluroRouter.appRouter.pop(this, result);
  }
}
