// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  final tbClient = getIt<ITbClientService>().client;
  final res = await tbClient
      .getTwoFactorAuthConfigControllerApi()
      .generateTwoFaAccountConfig(providerType: type.name);
  return res.data!;
}

// @riverpod
// class TwoFactorSetup extends _$TwoFactorSetup {
//   final _tbClient = getIt<ITbClientService>().client;
//   @override
//   bool build() {
//     return true;
//   }

//   Future<TwoFaAccountConfig> generateConfig(TwoFaProviderType type) async {
//     return await _tbClient.getTwoFactorAuthService().generateTwoFaAccountConfig(
//       type,
//     );
//   }
//}
