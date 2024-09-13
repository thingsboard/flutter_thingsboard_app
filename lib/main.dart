import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
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

class ThingsboardApp extends StatelessWidget {
  const ThingsboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
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
      themeMode: ThemeMode.light,
      theme: tbTheme,
      darkTheme: tbDarkTheme,
      onGenerateRoute: getIt<ThingsboardAppRouter>().router.generator,
      navigatorObservers: [
        getIt<ThingsboardAppRouter>().tbContext.routeObserver,
      ],
    );
  }
}
