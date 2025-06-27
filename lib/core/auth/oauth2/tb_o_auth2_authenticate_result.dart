class TbOAuth2AuthenticateResult {

  TbOAuth2AuthenticateResult.success(this.accessToken, this.refreshToken);

  TbOAuth2AuthenticateResult.failed(this.error);
  String? accessToken;
  String? refreshToken;
  String? error;

  bool get success => error == null;
}
