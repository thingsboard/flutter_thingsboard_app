import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/routes/i_tb_routes.dart';
import 'package:thingsboard_app/features/authentication/presentation/login_page.dart';
import 'package:thingsboard_app/features/authentication/presentation/reset_password_request_page.dart';

class AuthRoutes implements ITbRoutes {
  late final loginHandler = Handler(
    handlerFunc: (context, params) {
      return const LoginPage();
    },
  );

  late final resetPasswordRequestHandler = Handler(
    handlerFunc: (context, params) {
      return ResetPasswordRequestPage();
    },
  );

  late final twoFactorAuthenticationHandler = Handler(
    handlerFunc: (context, params) {
      throw UnimplementedError();
      // return TwoFactorAuthenticationPage();
    },
  );

  @override
  void registerRoutes(FluroRouter router) {
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
