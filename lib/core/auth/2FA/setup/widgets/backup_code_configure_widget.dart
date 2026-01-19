import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_account_settings_provider/two_factor_setup_account_settings_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/totp_configure_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/export_module.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class BackupCodeConfigureWidget
    extends TwoFaConfigWidget<BackupCodeTwoFaAccountConfig> {
  const BackupCodeConfigureWidget({
    required super.config,
    required super.loading,
    required super.onConfigured,
  });
  Future<void> saveConfig() async {
    try {
      await getIt<ITbClientService>().client
          .getTwoFactorAuthService()
          .verifyAndSaveTwoFaAccountConfig(config);
    } catch (e) {
      // getIt<IOverlayService>().showErrorNotification(
      //   (ctx) => "Error saving codes: $e",
      // );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codesText = config.codes.join('\n');
    useEffect(() {
      saveConfig();
      return null;
    }, []);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ref.invalidate(acountTwoFactorSettingsProvider);
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Column(
              spacing: 20,
              children: [
                Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Print out the codes so you have them handy when you need to use them to log in to your account. You can use each backup code once.",
                      style: TbTextStyles.bodyMedium,
                    ),
                    Text(
                      "Once you leave this page, these codes cannot be shown again. Store them safely using the options above.",
                      style: TbTextStyles.bodyMedium,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.bordersLight),
                  ),
                  child: SelectableRegion(
                    selectionControls: MaterialTextSelectionControls(),
                    child: Column(
                      spacing: 12,
                      children: chunkList(config.codes, 2)
                          .map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(e[0], style: TbTextStyles.labelLarge),
                                Text(e[1], style: TbTextStyles.labelLarge),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: codesText),
                          );
                          getIt<IOverlayService>().showSuccessNotification(
                            duration: const Duration(seconds: 3),
                            (_) => S.of(context).copiedToClipboard,
                          );
                        },
                        icon: const Icon(Icons.copy),
                        label: Text(S.of(context).copy),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          final bytes = utf8.encode(codesText);
                          TbDashboardExportModule.saveWithFilePicker(
                            'backup-codes.txt',
                            bytes,
                          );
                        },
                        icon: const Icon(Icons.download),
                        label: const Text('Download (txt)'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onConfigured,
              child: Text(S.of(context).done),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getCodes(FormGroup form) async {
    loading.value = true;
    try {
      await getIt<ITbClientService>().client
          .getTwoFactorAuthService()
          .generateTwoFaAccountConfig(config.getProviderType());
    } catch (e) {
      // getIt<IOverlayService>().showErrorNotification(
      //   (ctx) => "Error sending code: $e",
      // );
    }
    loading.value = false;
  }
}

List<List<T>> chunkList<T>(Iterable<T> list, int chunkSize) {
  final List<List<T>> chunks = [];
  for (int i = 0; i < list.length; i += chunkSize) {
    chunks.add(list.toList().sublist(i, i + chunkSize));
  }
  return chunks;
}
