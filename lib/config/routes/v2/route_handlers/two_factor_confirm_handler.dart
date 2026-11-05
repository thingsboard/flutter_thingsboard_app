// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/config/routes/v2/route_handlers/authority_handler.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TwoFactorConfirmHandler extends AuthorityHandler {
  @override
  Authority get authority => Authority.PRE_VERIFICATION_TOKEN;

  @override
  String get path => LoginRoutes.login + LoginRoutes.mfaConfirm;
}
