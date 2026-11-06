// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'two_factor_avalible_providers.g.dart';

@riverpod
Future<List<TwoFaProviderInfo>> twoFaConfirmAvalibleProviders(Ref ref) async {
  final tbClient = getIt<ITbClientService>().client;
  try {
    final res = await tbClient
        .getTwoFactorAuthControllerApi()
        .getAvailableTwoFaProviderInfos();
    return res.data?.toList() ?? [];
  } catch (e) {
    return [];
  }
}
