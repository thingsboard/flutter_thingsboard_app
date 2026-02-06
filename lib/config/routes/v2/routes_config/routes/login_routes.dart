import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/two_factor_authentication_page.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/two_factor_auth_config_success.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/two_factor_auth_force_description.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/two_factor_auth_setup.dart';
import 'package:thingsboard_app/core/auth/login/view/login_page.dart';
import 'package:thingsboard_app/core/auth/reset_password/reset_password_request_page.dart';
import 'package:thingsboard_app/modules/version/view/update_required_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class LoginRoutes {
  static const login = '/login';
  static const resetPasswordRequest = '/resetPasswordRequest';
  static const updateRequired = '/updateRequired';
  static const mfaConfirm = '/mfaConfirm';
  static const mfaForce = '/mfaForce';
  static const mfaForceSuccess = '/mfaForceSuccess';
  static const mfaConfigure = '/mfaConfigure';
}

// Authentication routes
final loginRoutes = [
  GoRoute(
    path: LoginRoutes.login,
    routes: [
      GoRoute(
        path: LoginRoutes.resetPasswordRequest,
        builder: (context, state) {
          return const ResetPasswordRequestPage();
        },
      ),
      GoRoute(
        path: LoginRoutes.updateRequired,
        builder: (context, state) {
          return const UpdateRequiredPage();
        },
      ),
      GoRoute(
        path: LoginRoutes.mfaConfirm,
        builder: (context, state) {
          final skip =
              state.uri.queryParameters['skipDefault'].toString() == 'true';
          final providerQuery = state.uri.queryParameters['selectedProvider'];
          final providerType =
              providerQuery != null
                  ? twoFaProviderTypeFromString(providerQuery)
                  : null;

          return TwoFactorAuthenticationPage(
            skipDefault: skip,
            selectedProvider: providerType,
          );
        },
      ),
      GoRoute(
        path: LoginRoutes.mfaForce,
        builder: (context, state) => const TwoFactorAuthForceDescription(),
      ),
      GoRoute(
        path: LoginRoutes.mfaForceSuccess,
        builder: (context, state) {
          final providerQuery = state.uri.queryParameters['selectedProvider'];
          final providerType = twoFaProviderTypeFromString(
            providerQuery.toString(),
          );

          final force =
              bool.tryParse(state.uri.queryParameters['force'].toString()) ??
              false;
          return TwoFactorAuthConfigSuccess(isForce: force, type: providerType);
        },
      ),
      GoRoute(
        path: LoginRoutes.mfaConfigure,
        builder: (context, state) {
          final force =
              bool.tryParse(state.uri.queryParameters['force'].toString()) ??
              false;
          final providerQuery = state.uri.queryParameters['selectedProvider'];
          final providerType =
              providerQuery != null
                  ? twoFaProviderTypeFromString(providerQuery)
                  : null;

          return TwoFactorAuthSetup(
            isForce: force,
            selectedProvider: providerType,
          );
        },
      ),
    ],
    builder: (context, state) {
      final redirect = state.uri.queryParameters['redirect'];
      return LoginPage(riderectUrl: redirect);
    },
  ),
];
