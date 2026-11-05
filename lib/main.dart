// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/app_bloc_observer.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_tracking_notifications.dart';
import 'package:thingsboard_app/modules/notification/application/push_notification_display.dart';
import 'package:thingsboard_app/thingsboard_app.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:universal_platform/universal_platform.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  Hive.registerAdapter(RegionAdapter());
  await setUpRootDependencies();
  // A paused-session notification survives process death while the session
  // itself does not, so drop any leftover from a previous run.
  unawaited(getIt<ILiveTrackingNotifications>().clear());
  if (UniversalPlatform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(
      kDebugMode || EnvironmentVariables.verbose,
    );
  }

  try {
    await getIt<IFirebaseService>().initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log('main::FirebaseService.initializeApp() exception $e', error: e);
  }

  // Android only: TbFirebaseMessagingService posts a plain notification and
  // this handler replaces it with the icon version. On iOS the system shows
  // the push and the Notification Service Extension attaches the icon, so a
  // handler there would show every push twice.
  if (UniversalPlatform.isAndroid) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  try {
    final uri = await AppLinks().getInitialLink();
    if (uri != null) {
      await getIt<ILocalDatabaseService>().setInitialAppLink(uri.toString());
    }
  } catch (e) {
    log('main::getInitialUri() exception $e', error: e);
  }

  if (kDebugMode || EnvironmentVariables.verbose) {
    Bloc.observer = AppBlocObserver(getIt());
  }
  FlutterNativeSplash.remove();
  runApp(const ProviderScope(child: ThingsboardApp()));
}
