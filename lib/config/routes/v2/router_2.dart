import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/config/routes/route_not_found_widget.dart';
import 'package:thingsboard_app/config/routes/v2/redirects/redirects.dart';
import 'package:thingsboard_app/config/routes/v2/refresh_listenable.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes.dart';

part 'router_2.g.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey();

@riverpod
class Router extends _$Router {
   final routes = getRoutes();

  GoRouter _getRouter() {
    final listenable = RefreshListenable(ref);
    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: listenable,
      navigatorKey: globalNavigatorKey,
      redirect: (context, state) async {
        for (final redirect in redirects) {
          final mathchedRoute = await redirect.redirect(context, state, ref);
          if (mathchedRoute != null) {
            return mathchedRoute;
          }
        }
        return null;
      },
      initialLocation: '/',
      errorBuilder: (context, state) {
        return RouteNotFoundWidget(path: state.path ?? '');
      },
      routes: routes,
    );
  }
  @override
  GoRouter build() {
    return _getRouter();
  }
}
