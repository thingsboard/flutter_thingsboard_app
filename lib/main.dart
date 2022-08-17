import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:universal_platform/universal_platform.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/dashboard/main_dashboard_page.dart';
import 'package:thingsboard_app/widgets/two_page_view.dart';

import 'config/themes/tb_theme.dart';
import 'generated/l10n.dart';

final appRouter = ThingsboardAppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await FlutterDownloader.initialize();
//  await Permission.storage.request();

  if (UniversalPlatform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(ThingsboardApp());
}

class ThingsboardApp extends StatefulWidget {
  ThingsboardApp({Key? key}) : super(key: key);

  @override
  ThingsboardAppState createState() => ThingsboardAppState();
}

class ThingsboardAppState extends State<ThingsboardApp>
    with TickerProviderStateMixin
    implements TbMainDashboardHolder {
  final TwoPageViewController _mainPageViewController = TwoPageViewController();
  final MainDashboardPageController _mainDashboardPageController =
      MainDashboardPageController();

  final GlobalKey mainAppKey = GlobalKey();
  final GlobalKey dashboardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    appRouter.tbContext.setMainDashboardHolder(this);
  }

  @override
  Future<void> navigateToDashboard(String dashboardId,
      {String? dashboardTitle,
      String? state,
      bool? hideToolbar,
      bool animate = true}) async {
    await _mainDashboardPageController.openDashboard(dashboardId,
        dashboardTitle: dashboardTitle, state: state, hideToolbar: hideToolbar);
    _openDashboard(animate: animate);
  }

  @override
  Future<bool> dashboardGoBack() async {
    if (_mainPageViewController.index == 1) {
      var canGoBack = await _mainDashboardPageController.dashboardGoBack();
      if (canGoBack) {
        closeDashboard();
      }
      return false;
    }
    return true;
  }

  @override
  Future<bool> openMain({bool animate = true}) async {
    return _openMain(animate: animate);
  }

  @override
  Future<bool> closeMain({bool animate = true}) async {
    return _closeMain(animate: animate);
  }

  @override
  Future<bool> openDashboard({bool animate = true}) async {
    return _openDashboard(animate: animate);
  }

  @override
  Future<bool> closeDashboard({bool animate = true}) {
    return _closeDashboard(animate: animate);
  }

  bool isDashboardOpen() {
    return _mainPageViewController.index == 1;
  }

  Future<bool> _openMain({bool animate: true}) async {
    var res = await _mainPageViewController.open(0, animate: animate);
    if (res) {
      await _mainDashboardPageController.deactivateDashboard();
    }
    return res;
  }

  Future<bool> _closeMain({bool animate: true}) async {
    if (!isDashboardOpen()) {
      await _mainDashboardPageController.activateDashboard();
    }
    return _mainPageViewController.close(0, animate: animate);
  }

  Future<bool> _openDashboard({bool animate: true}) async {
    if (!isDashboardOpen()) {
      _mainDashboardPageController.activateDashboard();
    }
    return _mainPageViewController.open(1, animate: animate);
  }

  Future<bool> _closeDashboard({bool animate: true}) async {
    var res = await _mainPageViewController.close(1, animate: animate);
    if (res) {
      _mainDashboardPageController.deactivateDashboard();
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light));
    return MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        themeMode: ThemeMode.light,
        home: TwoPageView(
            controller: _mainPageViewController,
            first: MaterialApp(
              key: mainAppKey,
              scaffoldMessengerKey: appRouter.tbContext.messengerKey,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
              theme: tbTheme,
              themeMode: ThemeMode.light,
              darkTheme: tbDarkTheme,
              onGenerateRoute: appRouter.router.generator,
              navigatorObservers: [appRouter.tbContext.routeObserver],
            ),
            second: MaterialApp(
              key: dashboardKey,
              // scaffoldMessengerKey: appRouter.tbContext.messengerKey,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
              theme: tbTheme,
              themeMode: ThemeMode.light,
              darkTheme: tbDarkTheme,
              home: MainDashboardPage(appRouter.tbContext,
                  controller: _mainDashboardPageController),
            )));
  }
}
