import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/themes/dark_theme.dart';
import 'package:thingsboard_app/config/themes/tb_ce_theme.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ThingsboardApp extends HookConsumerWidget {
  const ThingsboardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ToastificationWrapper(
   child :  ColoredBox(
        color: tbCeTheme.scaffoldBackgroundColor,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          color: tbCeTheme.scaffoldBackgroundColor,
          localizationsDelegates: const [
            S.delegate,
            LocaleNamesLocalizationsDelegate(),
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
          themeMode: ThemeMode.light,
          theme: tbCeTheme,
          darkTheme: tbDarkTheme,
          routerConfig: router,
        ),
   )
    );
  }
}
