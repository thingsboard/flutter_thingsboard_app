// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
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

  Future<void> expectHome() async {
    await this(s.home).waitUntilVisible();
    await this(s.more).waitUntilVisible();
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

  /// Matches the field label, which adds `*` to required fields.
  RegExp _label(String label) => RegExp('^${RegExp.escape(label)}');
}
