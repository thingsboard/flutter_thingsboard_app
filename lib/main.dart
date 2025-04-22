import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thingsboard_app/app_bloc_observer.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/bloc/core_bloc.dart';
import 'package:thingsboard_app/core/notifications/toast_notification_cubit.dart';
import 'package:thingsboard_app/features/authentication/entities/region.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/thingsboard_app.dart';
import 'package:universal_platform/universal_platform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RegionAdapter());
  await getIt.setUpRootDependencies();

  if (UniversalPlatform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(
      kDebugMode || EnvironmentVariables.verbose,
    );
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

  if (kDebugMode || EnvironmentVariables.verbose) {
    Bloc.observer = AppBlocObserver(getIt());
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CoreBloc.create()),
        BlocProvider(create: (_) => ToastNotificationCubit(getIt())),
      ],
      child: const ThingsboardApp(),
    ),
  );
}
