import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'config/themes/tb_theme.dart';

final appRouter = ThingsboardAppRouter();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

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

class ThingsboardAppState extends State<ThingsboardApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: appRouter.tbContext.messengerKey,
      title: 'ThingsBoard',
      theme: tbTheme,
      darkTheme: tbDarkTheme,
      onGenerateRoute: appRouter.router.generator,
      navigatorObservers: [appRouter.tbContext.routeObserver],
    );
  }
}
