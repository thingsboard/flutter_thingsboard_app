import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/login/reset_password_request_page.dart';
import 'package:thingsboard_app/core/auth/login/two_factor_authentication_page.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

import 'login/login_page.dart';

class AuthRoutes extends TbRoutes {
  late var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return LoginPage(tbContext);
    },
  );

  late var resetPasswordRequestHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ResetPasswordRequestPage(tbContext);
    },
  );

  late var twoFactorAuthenticationHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return TwoFactorAuthenticationPage(tbContext);
    },
  );

  AuthRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router
      ..define('/login', handler: loginHandler)
      ..define(
        '/login/resetPasswordRequest',
        handler: resetPasswordRequestHandler,
      )
      ..define(
        '/login/mfa',
        handler: twoFactorAuthenticationHandler,
      );
  }
}
