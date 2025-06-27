import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/core/auth/login/login_page.dart';
import 'package:thingsboard_app/core/auth/login/reset_password_request_page.dart';
import 'package:thingsboard_app/core/auth/login/two_factor_authentication_page.dart';

class AuthRoutes extends TbRoutes {
  AuthRoutes(super.tbContext);
  late Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return LoginPage(tbContext);
    },
  );

  late Handler resetPasswordRequestHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return ResetPasswordRequestPage(tbContext);
    },
  );

  late Handler twoFactorAuthenticationHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return TwoFactorAuthenticationPage(tbContext);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
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
