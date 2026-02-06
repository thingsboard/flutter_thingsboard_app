import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
part 'two_factor_setup_account_settings_provider.g.dart';

@riverpod
Future<AccountTwoFaSettings?> acountTwoFactorSettings(Ref ref) async {
  final client = getIt<ITbClientService>().client;
  final res = await client.getTwoFactorAuthService().getAccountTwoFaSettings();
  return res;
}
