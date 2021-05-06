import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class ThingsboardInitApp extends TbPageWidget<ThingsboardInitApp, _ThingsboardInitAppState> {

  ThingsboardInitApp(TbContext tbContext, {Key? key}) : super(tbContext, key: key) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light
    ));
  }

  @override
  _ThingsboardInitAppState createState() => _ThingsboardInitAppState();

}

class _ThingsboardInitAppState extends TbPageState<ThingsboardInitApp, _ThingsboardInitAppState> with TickerProviderStateMixin {

  late final AnimationController rotationController;
  late final CurvedAnimation animation;

  @override
  void initState() {
    rotationController = AnimationController(duration: Duration(milliseconds: 2000),
        vsync: this, upperBound: 1, animationBehavior: AnimationBehavior.preserve);
    animation = CurvedAnimation(parent: rotationController, curve: Curves.easeInOutCirc);
    super.initState();
    initTbContext();
    rotationController.forward(from: 0.0);
    rotationController.addListener(() {
      if (rotationController.status == AnimationStatus.completed) {
        rotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: AnimatedBuilder(
        animation: animation,
        child: Container(
          height: 50.0,
          width: 50.0,
          child: Image.asset(ThingsboardImage.thingsboard),
        ),
        builder: (BuildContext context, Widget? _widget) {
          return Transform.rotate(
            angle: animation.value * pi * 2,
            child: _widget,
          );
        },
      ),
    );
  }
}
