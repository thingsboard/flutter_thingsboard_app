import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'config/themes/tb_theme.dart';

final appRouter = ThingsboardAppRouter();

void main() {
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
      navigatorObservers: [appRouter.routeObserver],
    );
  }
}
