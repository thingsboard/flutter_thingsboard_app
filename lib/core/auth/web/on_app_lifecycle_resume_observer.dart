import 'package:flutter/cupertino.dart';

class OnAppLifecycleResumeObserver extends WidgetsBindingObserver {

  OnAppLifecycleResumeObserver(this.onResumed);
  final VoidCallback onResumed;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResumed();
    }
  }
}
