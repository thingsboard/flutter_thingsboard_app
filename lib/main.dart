import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thingsboard_app/app_bloc_observer.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/login/region.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:universal_platform/universal_platform.dart';

import 'config/themes/tb_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RegionAdapter());

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
    final uri = await AppLinks().getInitialLink();
    if (uri != null) {
      await getIt<ILocalDatabaseService>().setInitialAppLink(uri.toString());
    }
  } catch (e) {
    log('main::getInitialUri() exception $e', error: e);
  }

  if (kDebugMode) {
    Bloc.observer = AppBlocObserver(getIt());
  }

  runApp(const ThingsboardApp());
}

class ThingsboardApp extends StatelessWidget {
  const ThingsboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        getIt<ILayoutService>().setDeviceScreenSize(
          MediaQuery.of(context).size,
          orientation: MediaQuery.of(context).orientation,
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
      },
    );
  }
}
