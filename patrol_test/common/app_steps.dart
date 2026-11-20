// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart' show TestFailure;
import 'package:patrol/patrol.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/main.dart' as app;

/// Waits for the network: the defaults of 10 s are short for a cold start
/// against a remote server on a CI emulator.
const e2eConfig = PatrolTesterConfig(
  existsTimeout: Duration(seconds: 30),
  visibleTimeout: Duration(seconds: 30),
  printLogs: true,
);

/// How long to wait for the home screen after tapping Log In.
const signInTimeout = Duration(seconds: 60);

/// The emulators run in English.
final s = lookupS(const Locale('en'));

extension AppSteps on PatrolIntegrationTester {
  Future<void> startApp() async {
    await app.main();
    await pump();
  }

  Future<void> logIn(String email, String password) async {
    await this(TextField).containing(_label(s.email)).enterText(email);
    await this(TextField).containing(_label(s.password)).enterText(password);
    await this(ElevatedButton).containing(s.login).tap();
  }

  /// Waits for the home screen after sign-in. Signing in on a CI emulator
  /// against the remote server can take far longer than on a phone, so this
  /// waits up to [signInTimeout] instead of the usual 30 s.
  Future<void> expectHome() async {
    await this(s.home).waitUntilVisible(timeout: signInTimeout);
    await this(s.more).waitUntilVisible();
    await _allowNotifications();
  }

  /// The app asks for notification permission after sign-in. Flutter finders
  /// work behind the system prompt, but native ones such as
  /// [expectDashboardText] see only the prompt, and it stays up into the
  /// next test. Allow, not deny: without the permission the iOS app icon
  /// badge call throws an unhandled error, which fails the test.
  Future<void> _allowNotifications() async {
    if (await platform.mobile.isPermissionDialogVisible(
      timeout: const Duration(seconds: 10),
    )) {
      await platform.mobile.grantPermissionWhenInUse();
    }
  }

  Future<void> openDashboard(String title) async {
    await this(title).scrollTo().tap();
  }

  /// Waits for [text] inside the dashboard web view, which Flutter finders
  /// cannot see.
  Future<void> expectDashboardText(String text) async {
    await platform.mobile.waitUntilVisible(
      Selector(textContains: text),
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> closeDashboard() async {
    await this(Icons.arrow_back).tap();
  }

  Future<void> logOut() async {
    await this(s.more).tap();
    await this(s.logout).tap();
    await this(ElevatedButton).containing(s.login).waitUntilVisible();
  }

  /// Waits for the login page, for example after the session ended.
  Future<void> expectLoginPage() async {
    await this(ElevatedButton).containing(s.login).waitUntilVisible();
  }

  /// Patrol has no rotate command, so the app is asked for landscape the way
  /// a screen would ask. [resetOrientation] gives the choice back.
  Future<void> rotateToLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    await pump(const Duration(seconds: 1));
  }

  Future<void> resetOrientation() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await pump(const Duration(seconds: 1));
    await SystemChrome.setPreferredOrientations(const []);
  }

  /// Leaves the app for [duration], then brings it back.
  Future<void> backgroundFor(Duration duration) async {
    await platform.mobile.pressHome();
    await Future<void>.delayed(duration);
    await platform.mobile.openApp();
    await pump(const Duration(seconds: 1));
  }

  /// Goes back from a page: the app bar arrow on Android, the edge swipe on
  /// iOS.
  ///
  /// Not the Android back key: under Patrol on Android 16 it closed the app
  /// from the alarm details page, while the same key in the app run by hand
  /// on an Android 16 emulator went back to the list.
  Future<void> goBack() async {
    if (Platform.isAndroid) {
      await this(Icons.arrow_back).tap();
    } else {
      await platform.ios.swipeBack();
    }
    await pump(const Duration(seconds: 1));
  }

  /// The code submits by itself once it has 6 digits.
  Future<void> enterTwoFactorCode(String code) async {
    await this(TextField)
        .containing(_label(s.toptAuthPlaceholder))
        .enterText(code);
  }

  Future<void> expectTwoFactorPage() async {
    await this(s.verifyYourIdentity).waitUntilVisible();
  }

  Future<void> expectWrongTwoFactorCode() async {
    await this(s.verificationCodeIncorrect).waitUntilVisible();
  }

  Future<void> openAlarms() async {
    await this(s.alarms(2)).tap();
  }

  /// Waits until the app shows either the login page (returns true) or the
  /// alarm list (returns false), whichever comes first.
  Future<bool> waitForLoginPageOrAlarms({
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final loginButton = this(ElevatedButton).containing(s.login);
    final alarmList = this(RefreshIndicator);
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await pump(const Duration(milliseconds: 500));
      if (loginButton.exists) return true;
      if (alarmList.exists) return false;
    }
    throw TestFailure(
      'Neither the login page nor the alarm list appeared within $timeout',
    );
  }

  /// Pulls the alarm list down, so the app asks the server again instead of
  /// showing what it already loaded.
  Future<void> refreshAlarms() async {
    // The list appears a moment after the tab opens.
    await this(RefreshIndicator).waitUntilExists();
    await tester.fling(
      this(RefreshIndicator).first,
      const Offset(0, 400),
      1000,
    );
    await pump(const Duration(seconds: 2));
  }

  Future<void> openAlarmDetails(String type) async {
    await this(type).waitUntilVisible();
    await this(Icons.more_vert).tap();
    await this(s.acknowledge).waitUntilVisible();
  }

  Future<void> acknowledgeAlarm() async {
    await this(ElevatedButton).containing(s.acknowledge).tap();
    await this(s.alarmAcknowledgeTitle).waitUntilVisible();
    await this(TextButton).containing(s.yes.toUpperCase()).tap();
  }

  /// The status line on the alarm card and on the details page.
  Future<void> expectAlarmStatus({required bool acknowledged}) async {
    await this(
      '${s.active} ${acknowledged ? s.acknowledged : s.unacknowledged}',
    ).waitUntilVisible();
  }

  /// Opens the More page, which starts with the signed-in user.
  Future<void> openMore() async {
    await this(s.more).tap();
    await this(s.logout).waitUntilVisible();
  }

  /// Matches the field label, which adds `*` to required fields.
  RegExp _label(String label) => RegExp('^${RegExp.escape(label)}');
}
