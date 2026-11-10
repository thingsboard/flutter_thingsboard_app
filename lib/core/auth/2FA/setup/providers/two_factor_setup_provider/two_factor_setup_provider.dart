// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'two_factor_setup_provider.g.dart';

@riverpod
Future<TwoFaAccountConfig> generateConfig(
  Ref ref,
  TwoFaProviderType type,
) async {
  // The server's SMS template is empty, and its null phone does not parse:
  // the user types the number on the next step.
  if (type == TwoFaProviderType.SMS) {
    return SmsTwoFaAccountConfig((b) => b..phoneNumber = '');
  }
  final tbClient = getIt<ITbClientService>().client;
  final res = await tbClient
      .getTwoFactorAuthConfigControllerApi()
      .generateTwoFaAccountConfig(providerType: type.name);
  return res.data!;
}
