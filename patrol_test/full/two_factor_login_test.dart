// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_server.dart';
import '../common/totp.dart';

/// Journey 3: a user with TOTP two-factor login sees an error for a wrong
/// code, keeps the code page after leaving the app to copy a code, and gets
/// in with the right one.
void main() {
  patrolTest('customer user signs in with a TOTP code', config: e2eConfig, (
    $,
  ) async {
    final server = await E2eServer.signIn();
    await server.deleteStaleCustomers();
    final user = await server.createCustomerUser();
    try {
      final totp = await E2eServer.enableTotp(user);
      // The setup used the current code; a new step gives a fresh one.
      await Totp.waitForNextStep();

      await $.startApp();
      await $.logIn(user.email, user.password);
      await $.expectTwoFactorPage();
      await $.enterTwoFactorCode(_wrong(totp.now()));
      await $.expectWrongTwoFactorCode();
      await $.backgroundFor(const Duration(seconds: 5));
      await $.expectTwoFactorPage();
      await $.enterTwoFactorCode(totp.now());
      await $.expectHome();
      await $.logOut();
    } finally {
      await server.cleanUpCustomer(user.customerId);
    }
  });
}

/// A code that differs from [code] in every digit, so it cannot be valid.
String _wrong(String code) =>
    code.split('').map((d) => ((int.parse(d) + 5) % 10).toString()).join();
