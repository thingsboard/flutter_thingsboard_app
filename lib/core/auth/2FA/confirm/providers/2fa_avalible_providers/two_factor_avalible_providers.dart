import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

part 'two_factor_avalible_providers.g.dart';

@riverpod
Future<List<TwoFaProviderInfo>> twoFaConfirmAvalibleProviders(Ref ref) async {
  final tbClient = getIt<ITbClientService>().client;
  try {
    final info = await tbClient
        .getTwoFactorAuthService()
        .getAvailableLoginTwoFaProviders();
    return info;
  } catch (e) {
    return [];
  }
}
