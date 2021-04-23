import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_secure_storage.dart';
import 'package:thingsboard_app/constants/api_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

enum NotificationType {
  info,
  warn,
  success,
  error
}

class TbContext {
  bool _initialized = false;
  bool isUserLoaded = false;
  bool isAuthenticated = false;
  final _isLoadingNotifier = ValueNotifier<bool>(false);

  GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();
  late ThingsboardClient tbClient;

  final FluroRouter router;
  final RouteObserver<PageRoute> routeObserver;

  TbContextState? currentState;

  TbContext(this.router, this.routeObserver);

  void init() {
    assert(() {
      if (_initialized) {
        throw StateError('TbContext already initialized!');
      }
      return true;
    }());
    _initialized = true;
    tbClient = ThingsboardClient(thingsBoardApiEndpoint,
                                 storage: TbSecureStorage(),
                                 onUserLoaded: onUserLoaded,
                                 onError: onError,
                                 onLoadStarted: onLoadStarted,
                                 onLoadFinished: onLoadFinished,
                                 computeFunc: <Q, R>(callback, message) => compute(callback, message));
    tbClient.init().onError((error, stackTrace) {
      print('Error: $error');
      print('Stack: $stackTrace');
    });
  }

  void onError(ThingsboardError error) {
    print('onError: error=$error');
    showErrorNotification(error.message!);
  }

  void showErrorNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.error, duration: duration);
  }

  void showInfoNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.info, duration: duration);
  }

  void showWarnNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.warn, duration: duration);
  }

  void showSuccessNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.success, duration: duration);
  }

  void showNotification(String message, NotificationType type, {Duration? duration}) {
    duration ??= const Duration(days: 1);
    Color backgroundColor;
    var textColor = Color(0xFFFFFFFF);
    switch(type) {
      case NotificationType.info:
        backgroundColor = Color(0xFF323232);
        break;
      case NotificationType.warn:
        backgroundColor = Color(0xFFdc6d1b);
        break;
      case NotificationType.success:
        backgroundColor = Color(0xFF008000);
        break;
      case NotificationType.error:
        backgroundColor = Color(0xFF800000);
        break;
    }
    final snackBar = SnackBar(
      duration: duration,
      backgroundColor: backgroundColor,
      content: Text(message,
        style: TextStyle(
          color: textColor
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: textColor,
        onPressed: () {
          messengerKey.currentState!.hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
        },
      ),
    );
    messengerKey.currentState!.removeCurrentSnackBar();
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  void hideNotification() {
    messengerKey.currentState!.removeCurrentSnackBar();
  }

  void onLoadStarted() {
    print('ON LOAD STARTED!');
    _isLoadingNotifier.value = true;
  }

  void onLoadFinished() {
    print('ON LOAD FINISHED!');
    _isLoadingNotifier.value = false;
  }

  Future<void> onUserLoaded() async {
    try {
      print('onUserLoaded: isAuthenticated=${tbClient.isAuthenticated()}');
      isUserLoaded = true;
      isAuthenticated = tbClient.isAuthenticated();
      if (tbClient.isAuthenticated()) {
        print('authUser: ${tbClient.getAuthUser()}');
      }
      updateRouteState();
    } catch (e, s) {
      print('Error: $e');
      print('Stack: $s');
    }
  }

  void updateRouteState() {
    if (currentState != null) {
      if (tbClient.isAuthenticated()) {
        navigateTo('/home', replace: true);
      } else {
        navigateTo('/login', replace: true, clearStack: true, transition: TransitionType.inFromTop);
      }
    }
  }

  void navigateTo(String path, {bool replace = false, bool clearStack = false, TransitionType? transition}) {
    if (currentState != null) {
      if (transition == null) {
        transition = TransitionType.inFromRight;
      }
      hideNotification();
      router.navigateTo(currentState!.context, path, transition: transition, replace: replace, clearStack: clearStack);
    }
  }

  void pop() {
    if (currentState != null) {
      router.pop(currentState!.context);
    }
  }
}

mixin HasTbContext {
  late final TbContext _tbContext;

  void setTbContext(TbContext tbContext) {
    _tbContext = tbContext;
  }

  void setupTbContext(TbContextState currentState) {
    _tbContext = currentState.widget.tbContext;
  }

  void setupCurrentState(TbContextState currentState) {
    _tbContext.currentState = currentState;
  }

  ValueNotifier<bool> get loadingNotifier => _tbContext._isLoadingNotifier;
  TbContext get tbContext => _tbContext;

  void navigateTo(String path, {bool replace = false}) => _tbContext.navigateTo(path, replace: replace);

  void pop() => _tbContext.pop();

  void hideNotification() => _tbContext.hideNotification();

  void showErrorNotification(String message, {Duration? duration}) => _tbContext.showErrorNotification(message, duration: duration);

  void showInfoNotification(String message, {Duration? duration}) => _tbContext.showInfoNotification(message, duration: duration);

  void showWarnNotification(String message, {Duration? duration}) => _tbContext.showWarnNotification(message, duration: duration);

  void showSuccessNotification(String message, {Duration? duration}) => _tbContext.showSuccessNotification(message, duration: duration);

}
