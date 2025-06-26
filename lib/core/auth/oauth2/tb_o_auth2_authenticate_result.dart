class TbOAuth2AuthenticateResult {
  String? accessToken;
  String? refreshToken;
  String? error;

  TbOAuth2AuthenticateResult.success(this.accessToken, this.refreshToken);

  TbOAuth2AuthenticateResult.failed(this.error);

  bool get success => error == null;
}
