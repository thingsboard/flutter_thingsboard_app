import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/use_app_links.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';

import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:toastification/toastification.dart';

class ThingsboardApp extends HookConsumerWidget {
  const ThingsboardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final wlState = ref.watch(wlProvider);

    useAppLinks();

    return ToastificationWrapper(
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: wlState.wlParams.appTitle,
        themeMode: ThemeMode.light,
        theme: wlState.theme,
        darkTheme: wlState.theme,
        routerConfig: router,
      ),
    );
  }
}
