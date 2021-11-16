import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/login/reset_password_request_page.dart';
import 'package:thingsboard_app/core/auth/signup/email_verified_page.dart';
import 'package:thingsboard_app/core/auth/signup/privacy_policy.dart';
import 'package:thingsboard_app/core/auth/signup/signup_page.dart';
import 'package:thingsboard_app/core/auth/signup/terms_of_use.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

import 'login/login_page.dart';
import 'signup/email_verification_page.dart';

class AuthRoutes extends TbRoutes {

  late var loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginPage(tbContext);
  });

  late var resetPasswordRequestHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ResetPasswordRequestPage(tbContext);
  });

  late var signUpHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SignUpPage(tbContext);
  });

  late var privacyPolicyHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PrivacyPolicy(tbContext);
  });

  late var termsOfUseHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TermsOfUse(tbContext);
  });

  late var emailVerificationHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var email = params['email']?.first;
    return EmailVerificationPage(tbContext, email: email);
  });

  late var emailVerifiedHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var emailCode = params['emailCode']?.first;
    return EmailVerifiedPage(tbContext, emailCode: emailCode);
  });

  AuthRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/login", handler: loginHandler);
    router.define("/login/resetPasswordRequest", handler: resetPasswordRequestHandler);
    router.define("/signup", handler: signUpHandler);
    router.define("/signup/privacyPolicy", handler: privacyPolicyHandler);
    router.define("/signup/termsOfUse", handler: termsOfUseHandler);
    router.define("/signup/emailVerification", handler: emailVerificationHandler);
    router.define("/signup/emailVerified", handler: emailVerifiedHandler);
  }

}
