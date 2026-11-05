
import 'package:thingsboard_app/config/routes/v2/route_handlers/authority_handler.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TwoFactorConfirmHandler extends AuthorityHandler {
  @override
  Authority get authority => Authority.PRE_VERIFICATION_TOKEN;

  @override
  String get path => LoginRoutes.login + LoginRoutes.mfaConfirm;
}
