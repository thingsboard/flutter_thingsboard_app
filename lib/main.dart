import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/dashboard/main_dashboard_page.dart';
import 'package:thingsboard_app/widgets/transition_indexed_stack.dart';

import 'config/themes/tb_theme.dart';

final appRouter = ThingsboardAppRouter();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
//  await FlutterDownloader.initialize();
//  await Permission.storage.request();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(ThingsboardApp());
}

class ThingsboardApp extends StatefulWidget {

  ThingsboardApp({Key? key}) : super(key: key);

  @override
  ThingsboardAppState createState() => ThingsboardAppState();

}

class ThingsboardAppState extends State<ThingsboardApp> with TickerProviderStateMixin implements TbMainDashboardHolder {

  final TransitionIndexedStackController _mainStackController = TransitionIndexedStackController();
  final MainDashboardPageController _mainDashboardPageController = MainDashboardPageController();

  final GlobalKey mainAppKey = GlobalKey();
  final GlobalKey dashboardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    appRouter.tbContext.setMainDashboardHolder(this);
  }

  @override
  Future<void> navigateToDashboard(String dashboardId, {String? dashboardTitle, String? state, bool? hideToolbar, bool animate = true}) async {
    await _mainDashboardPageController.openDashboard(dashboardId, dashboardTitle: dashboardTitle, state: state, hideToolbar: hideToolbar);
    await _openDashboard(animate: animate);
  }

  @override
  Future<bool> dashboardGoBack() async {
    if (_mainStackController.index == 1) {
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
    return _mainStackController.index == 1;
  }

  Future<bool> _openMain({bool animate: true}) async {
    var res = await _mainStackController.open(0, animate: animate);
    if (res) {
      await _mainDashboardPageController.deactivateDashboard();
    }
    return res;
  }

  Future<bool> _closeMain({bool animate: true}) async {
    if (!isDashboardOpen()) {
      await _mainDashboardPageController.activateDashboard();
    }
    return _mainStackController.close(0, animate: animate);
  }

  Future<bool> _openDashboard({bool animate: true}) async {
    if (!isDashboardOpen()) {
      _mainDashboardPageController.activateDashboard();
    }
    return _mainStackController.open(1, animate: animate);
  }

  Future<bool> _closeDashboard({bool animate: true}) async {
    var res = await _mainStackController.close(1, animate: animate);
    if (res) {
      _mainDashboardPageController.deactivateDashboard();
    }
    return res;
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light
    ));
    return MaterialApp(
      title: 'ThingsBoard',
        home: TransitionIndexedStack(
          controller: _mainStackController,
          first: MaterialApp(
            key: mainAppKey,
            scaffoldMessengerKey: appRouter.tbContext.messengerKey,
            title: 'ThingsBoard',
            theme: tbTheme,
            darkTheme: tbDarkTheme,
            onGenerateRoute: appRouter.router.generator,
            navigatorObservers: [appRouter.tbContext.routeObserver],
          ),
          second: MaterialApp(
            key: dashboardKey,
            // scaffoldMessengerKey: appRouter.tbContext.messengerKey,
            title: 'ThingsBoard',
            theme: tbTheme,
            darkTheme: tbDarkTheme,
            home: MainDashboardPage(appRouter.tbContext, controller: _mainDashboardPageController),
          )
        )
    );
  }

}
