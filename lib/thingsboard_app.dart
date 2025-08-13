import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:toastification/toastification.dart';

class ThingsboardApp extends StatefulWidget {
  const ThingsboardApp({super.key});

  @override
  State<StatefulWidget> createState() => _ThingsBoardAppState();
}

class _ThingsBoardAppState extends State<ThingsboardApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<ILayoutService>().setDeviceScreenSize(
        MediaQuery.of(context).size,
        orientation: MediaQuery.of(context).orientation,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        themeMode: ThemeMode.light,
        theme: tbTheme,
        darkTheme: tbDarkTheme,
        navigatorKey: getIt<ThingsboardAppRouter>().navigatorKey,
       onGenerateRoute: getIt<ThingsboardAppRouter>().router.generator,
        navigatorObservers: [
          getIt<ThingsboardAppRouter>().tbContext.routeObserver,
        ],
      ),
    );
  }
}
