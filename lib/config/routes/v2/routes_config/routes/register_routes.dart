// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/core/auth/signup/email_verification_page.dart';
import 'package:thingsboard_app/core/auth/signup/email_verified_page.dart';
import 'package:thingsboard_app/core/auth/signup/privacy_policy.dart';
import 'package:thingsboard_app/core/auth/signup/signup_page.dart';
import 'package:thingsboard_app/core/auth/signup/terms_of_use.dart';
import 'package:thingsboard_app/core/select_region/choose_region_screen.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/core/select_region/select_region_screen.dart';
import 'package:thingsboard_app/utils/ui/tb_recaptcha.dart';

abstract final class RegisterRoutes {
  static const register = '/register';
  static const reacaptcha = '/tbRecaptcha';
  static const privacyPolicy = '/privacyPolicy';
  static const termsOfUse = '/termsOfUse';
  static const verifyEmail = '/emailVerification';
  static const emailVerified = '/signup/emailVerified';
  static const values = {
    RegisterRoutes.privacyPolicy,
    RegisterRoutes.reacaptcha,
    RegisterRoutes.register,
    RegisterRoutes.termsOfUse,
    RegisterRoutes.verifyEmail,
    RegisterRoutes.emailVerified
  };
  static bool isRegisterRoute(String path) => values.contains(path);
}

final registerRoutes = [
  GoRoute(
    path: RegisterRoutes.register,
    builder: (context, state) {
      return const SignUpPage();
    },
  ),
  GoRoute(
    path: RegisterRoutes.reacaptcha,
    builder: (context, state) {
      final siteKey = state.uri.queryParameters['siteKey'].toString();
      final version = state.uri.queryParameters['version'].toString();
      return TbRecaptcha(siteKey: siteKey, version: version);
    },
  ),
  GoRoute(
    path: RegisterRoutes.privacyPolicy,
    builder: (context, state) {
      return const PrivacyPolicy();
    },
  ),
  GoRoute(
    path: RegisterRoutes.termsOfUse,
    builder: (context, state) {
      return const TermsOfUse();
    },
  ),
  GoRoute(
    path: RegisterRoutes.verifyEmail,
    builder: (context, state) {
      final email = Uri.decodeComponent(
        state.uri.queryParameters['email'].toString(),
      );
      return EmailVerificationPage(email: email);
    },
  ),
  GoRoute(
    path: RegisterRoutes.emailVerified,
    builder: (context, state) {
      final emailCode = state.uri.queryParameters['emailCode'].toString();

      return EmailVerifiedPage(emailCode: emailCode,);
    },
  ),
];
