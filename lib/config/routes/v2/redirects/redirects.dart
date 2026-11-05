import 'package:thingsboard_app/config/routes/v2/redirects/endpoint_redirect.dart';
import 'package:thingsboard_app/core/auth/2FA/redirect/two_factor_configure_redirect.dart';
import 'package:thingsboard_app/core/auth/2FA/redirect/two_factor_confirm_redirect.dart';
import 'package:thingsboard_app/core/auth/redirect/auth_redirect.dart';
import 'package:thingsboard_app/modules/version/version_redirect.dart';

final redirects = [
  EndpointRedirect(),
  AuthRedirect(),
  TwoFactorAuthConfirmRedirect(),
  TwoFactorAuthSetupRedirect(),
  VersionRedirect(),

];
