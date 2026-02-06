
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
part 'two_factor_setup_provider.g.dart';

@riverpod
Future<TwoFaAccountConfig> generateConfig(
  Ref ref,
  TwoFaProviderType type,
) async {
  final tbClient = getIt<ITbClientService>().client;
  return await tbClient.getTwoFactorAuthService().generateTwoFaAccountConfig(
    type,
  );
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
