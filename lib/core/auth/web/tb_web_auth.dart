import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show MethodChannel;

class _OnAppLifecycleResumeObserver extends WidgetsBindingObserver {
  final Function onResumed;

  _OnAppLifecycleResumeObserver(this.onResumed);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResumed();
    }
  }
}

class TbWebAuth {
  static const MethodChannel _channel = const MethodChannel('tb_web_auth');

  static final _OnAppLifecycleResumeObserver _resumedObserver =
      _OnAppLifecycleResumeObserver(() {
    _cleanUpDanglingCalls();
  });

  static Future<String> authenticate(
      {required String url,
      required String callbackUrlScheme,
      bool? saveHistory}) async {
    WidgetsBinding.instance.removeObserver(
        _resumedObserver); // safety measure so we never add this observer twice
    WidgetsBinding.instance.addObserver(_resumedObserver);
    return await _channel.invokeMethod('authenticate', <String, dynamic>{
      'url': url,
      'callbackUrlScheme': callbackUrlScheme,
      'saveHistory': saveHistory,
    }) as String;
  }

  static Future<void> _cleanUpDanglingCalls() async {
    await _channel.invokeMethod('cleanUpDanglingCalls');
    WidgetsBinding.instance.removeObserver(_resumedObserver);
  }
}
