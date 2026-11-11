// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_page_background.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/widgets/fill_scroll_view.dart';

/// Shown instead of signing in when the server is older than the app
/// supports: the user cannot fix it, so it says whom to ask, and the login
/// page (QR code, region) is the way to another server.
class ServerUpdateRequiredPage extends StatelessWidget {
  const ServerUpdateRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    final clientService = getIt<ITbClientService>();
    final error = clientService.unsupportedServer.value;
    final host =
        Uri.tryParse(getIt<IEndpointService>().getCachedEndpoint())?.host ?? '';
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) clientService.clearUnsupportedServer();
      },
      // No app bar sets the status bar style here, and the login page under
      // this one asks for light icons on its dark background.
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: Stack(
            children: [
              const LoginPageBackground(),
              SafeArea(
                child: FillScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        ThingsboardImage.mobileConnectionError,
                        height: 140,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        S.of(context).serverUpdateRequired,
                        textAlign: TextAlign.center,
                        style: TbTextStyles.titleMedium.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (error != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          S
                              .of(context)
                              .serverRequiresVersion(
                                displayVersion(error.minVersion),
                              ),
                          textAlign: TextAlign.center,
                          style: TbTextStyles.bodyLarge.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _ServerCard(
                          host: host,
                          version: displayVersion(error.serverVersion),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).askAdminToUpdateServer,
                        textAlign: TextAlign.center,
                        style: TbTextStyles.bodyMedium.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      const Spacer(flex: 2),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: clientService.clearUnsupportedServer,
                        child: Text(S.of(context).backToLogin),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServerCard extends StatelessWidget {
  const _ServerCard({required this.host, required this.version});

  final String host;
  final String version;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bordersLight),
      ),
      child: Column(
        spacing: 8,
        children: [
          _row(S.of(context).serverLabel, host, AppColors.textPrimary),
          _row(S.of(context).versionLabel, version, AppColors.textError),
        ],
      ),
    );
  }

  Widget _row(String label, String value, Color valueColor) => Row(
    spacing: 16,
    children: [
      Text(
        label,
        style: TbTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
      ),
      Expanded(
        child: Text(
          value,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          style: TbTextStyles.labelLarge.copyWith(color: valueColor),
        ),
      ),
    ],
  );
}

/// The release a person recognises: `4.2.2.8PE-SNAPSHOT.321c` -> `4.2.2.8`,
/// `4.4.0` -> `4.4`.
@visibleForTesting
String displayVersion(String version) {
  final numbers = RegExp(r'^\d+(\.\d+)*').stringMatch(version);
  if (numbers == null) return version;
  return numbers.replaceFirst(RegExp(r'(\.0)+$'), '');
}
