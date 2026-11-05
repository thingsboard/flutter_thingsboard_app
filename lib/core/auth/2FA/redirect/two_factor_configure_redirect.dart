import 'package:thingsboard_app/config/routes/v2/redirects/authority_redirect.dart';

import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TwoFactorAuthSetupRedirect extends AuthorityRedirect {
  @override
  Authority get authority => Authority.MFA_CONFIGURATION_TOKEN;
  @override
  String get path => LoginRoutes.login + LoginRoutes.mfaForce;
}
