// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

class TbOAuth2AuthenticateResult {

  TbOAuth2AuthenticateResult.success(this.accessToken, this.refreshToken);

  TbOAuth2AuthenticateResult.failed(this.error);
  String? accessToken;
  String? refreshToken;
  String? error;

  bool get success => error == null;
}
