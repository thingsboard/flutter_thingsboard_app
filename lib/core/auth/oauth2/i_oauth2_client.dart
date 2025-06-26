import 'package:thingsboard_app/core/auth/oauth2/tb_o_auth2_authenticate_result.dart';
abstract interface class IOAuth2Client {
  Future<TbOAuth2AuthenticateResult> authenticate(String oauth2Url);
}
