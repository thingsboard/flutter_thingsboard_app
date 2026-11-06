// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/config/routes/use_app_links.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';

import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/providers/app_locale/app_locale_provider.dart';
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
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        locale: ref.watch(appLocaleProvider),
        localeListResolutionCallback: resolveAppLocale,
        builder: (context, child) {
          // Formats without an explicit locale (DateFormat.yMd()) follow
          // the app language.
          Intl.defaultLocale = Localizations.localeOf(context).toString();
          return child!;
        },
        title: wlState.wlParams.appTitle,
        themeMode: ThemeMode.light,
        theme: wlState.theme,
        darkTheme: wlState.theme,
        routerConfig: router,
      ),
    );
  }
}
