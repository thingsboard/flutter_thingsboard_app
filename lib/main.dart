import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/main_dashboard_page.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/widgets/two_page_view.dart';
import 'package:uni_links/uni_links.dart';
import 'package:universal_platform/universal_platform.dart';

import 'config/themes/tb_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await FlutterDownloader.initialize();
//  await Permission.storage.request();
  await Hive.initFlutter();

  await setUpRootDependencies();
  if (UniversalPlatform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  try {
    getIt<IFirebaseService>().initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log('main::FirebaseService.initializeApp() exception $e', error: e);
  }

  try {
    final uri = await getInitialUri();
    if (uri != null) {
      await getIt<ILocalDatabaseService>().setItem(
        DatabaseKeys.initialAppLink,
        uri.toString(),
      );
    }
  } catch (e) {
    log('main::getInitialUri() exception $e', error: e);
  }

  runApp(const ThingsboardApp());
}

class ThingsboardApp extends StatefulWidget {
  const ThingsboardApp({Key? key}) : super(key: key);

  @override
  ThingsboardAppState createState() => ThingsboardAppState();
}

class ThingsboardAppState extends State<ThingsboardApp>
    with TickerProviderStateMixin
    implements TbMainDashboardHolder {
  final _mainPageViewController = TwoPageViewController();
  final _mainDashboardPageController = MainDashboardPageController();

  final mainAppKey = GlobalKey();
  final dashboardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    getIt<ThingsboardAppRouter>().tbContext.setMainDashboardHolder(this);
  }

  @override
  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  }) async {
    await _mainDashboardPageController.openDashboard(
      dashboardId,
      dashboardTitle: dashboardTitle,
      state: state,
      hideToolbar: hideToolbar,
    );

    _openDashboard(animate: animate);
  }

  @override
  Future<bool> dashboardGoBack() async {
    if (_mainPageViewController.index == 1) {
      final canGoBack = await _mainDashboardPageController.dashboardGoBack();
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

  @override
  bool isDashboardOpen() {
    return _mainPageViewController.index == 1;
  }

  Future<bool> _openMain({bool animate = true}) async {
    final res = await _mainPageViewController.open(0, animate: animate);
    if (res) {
      await _mainDashboardPageController.deactivateDashboard();
    }

    return res;
  }

  Future<bool> _closeMain({bool animate = true}) async {
    if (!isDashboardOpen()) {
      await _mainDashboardPageController.activateDashboard();
    }

    return _mainPageViewController.close(0, animate: animate);
  }

  Future<bool> _openDashboard({bool animate = true}) async {
    if (!isDashboardOpen()) {
      _mainDashboardPageController.activateDashboard();
    }

    return _mainPageViewController.open(1, animate: animate);
  }

  Future<bool> _closeDashboard({bool animate = true}) async {
    final res = await _mainPageViewController.close(1, animate: animate);
    if (res) {
      _mainDashboardPageController.deactivateDashboard();
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      themeMode: ThemeMode.light,
      home: TwoPageView(
        controller: _mainPageViewController,
        first: MaterialApp(
          debugShowCheckedModeBanner: false,
          key: mainAppKey,
          scaffoldMessengerKey:
              getIt<ThingsboardAppRouter>().tbContext.messengerKey,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.supportedLocales,
          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
          theme: tbTheme,
          themeMode: ThemeMode.light,
          darkTheme: tbDarkTheme,
          onGenerateRoute: getIt<ThingsboardAppRouter>().router.generator,
          navigatorObservers: [
            getIt<ThingsboardAppRouter>().tbContext.routeObserver,
          ],
        ),
        second: MaterialApp(
          debugShowCheckedModeBanner: false,
          key: dashboardKey,
          // scaffoldMessengerKey: appRouter.tbContext.messengerKey,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.supportedLocales,
          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
          theme: tbTheme,
          themeMode: ThemeMode.light,
          darkTheme: tbDarkTheme,
          home: MainDashboardPage(
            getIt<ThingsboardAppRouter>().tbContext,
            controller: _mainDashboardPageController,
          ),
        ),
      ),
    );
  }
}
