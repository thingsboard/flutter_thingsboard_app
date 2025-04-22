import 'dart:async' show StreamSubscription;

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/core/bloc/core_bloc.dart';
import 'package:thingsboard_app/modules/version/route/version_route.dart';
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart';
import 'package:thingsboard_app/utils/ui/build_context_extension.dart';
import 'package:thingsboard_app/utils/ui/tb_loading_screen.dart';
import 'package:toastification/toastification.dart';

class ThingsboardApp extends StatefulWidget {
  const ThingsboardApp({super.key});

  @override
  State<StatefulWidget> createState() => _ThingsBoardAppState();
}

class _ThingsBoardAppState extends State<ThingsboardApp> {
  final _navKey = GlobalKey<NavigatorState>();
  late final StreamSubscription _coreSub;

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        navigatorKey: _navKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.supportedLocales,
        onGenerateTitle: (context) => S.of(context).appTitle,
        themeMode: ThemeMode.light,
        theme: tbTheme,
        darkTheme: tbDarkTheme,
        onGenerateRoute: FluroRouter.appRouter.generator,
        home: const TbLoadingScreen(),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoreBloc>().add(
            CoreEventInit(
              screenSize: MediaQuery.of(context).size,
              orientation: MediaQuery.of(context).orientation,
            ),
          );
    });

    _coreSub = context.read<CoreBloc>().stream.listen((state) {
      final navContext = _navKey.currentContext;

      state.maybeWhen(
        fatalError: (message) => navContext?.alert(
          title: S.of(context).fatalErrorTitle,
          message: message ?? S.of(context).unknownError,
        ),
        requireClientUpdate: (versionInfo, storeInfo) => navContext?.navigateTo(
          VersionRoutes.updateRequiredRoutePath,
          clearStack: true,
          replace: true,
          routeSettings: RouteSettings(
            arguments: VersionRouteArguments(
              versionInfo: versionInfo,
              storeInfo: storeInfo,
            ),
          ),
        ),
        userLoaded: (
          isFullyAuthenticated,
          defaultDashboardId,
          fullscreenDashboard,
        ) async {
          if (navContext == null) {
            return;
          } else if (!isFullyAuthenticated) {
            _goLogin(navContext);
          } else if (defaultDashboardId == null) {
            _goMain(navContext);
          } else if (fullscreenDashboard) {
            _goFullScreenDashboard(
              navContext,
              dashboardId: defaultDashboardId,
            );
          } else {
            await navContext.navigateToDashboard(defaultDashboardId);
            if (navContext.mounted == true) {
              _goMain(navContext, transition: TransitionType.none);
            }
          }
        },
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _coreSub.cancel();
    super.dispose();
  }

  void _goLogin(BuildContext context) {
    context.navigateTo(
      '/login',
      replace: true,
      clearStack: true,
      transition: TransitionType.fadeIn,
      transitionDuration: const Duration(milliseconds: 750),
    );
  }

  void _goMain(
    BuildContext context, {
    TransitionType transition = TransitionType.fadeIn,
  }) {
    context.navigateTo(
      '/main',
      replace: true,
      clearStack: true,
      transition: transition,
      transitionDuration: transition == TransitionType.none
          ? Duration.zero
          : const Duration(milliseconds: 750),
    );
  }

  void _goFullScreenDashboard(
    BuildContext context, {
    required String dashboardId,
  }) {
    context.navigateTo(
      '/fullscreenDashboard/$dashboardId',
      replace: true,
      clearStack: true,
      transition: TransitionType.fadeIn,
    );
  }
}
