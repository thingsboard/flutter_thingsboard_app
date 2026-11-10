// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/more/presentation/widgets/profile_widget.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

Widget getDeleteButton(BuildContext context, WidgetRef ref, User user) {
  if (!ref
      .watch(loginProvider)
      .hasGenericPermission(Resource.USER, Operation.DELETE)) {
    return const SizedBox.shrink();
  }
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(),
      ),
      TextButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textError,
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () async {
          await deleteAccount(context, ref, user);
        },
        child: Row(
          spacing: 4,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.delete_forever),
            Text(S.of(context).deleteAccount, style: TbTextStyles.labelMedium),
          ],
        ),
      ),
    ],
  );
}

/// Deletes only the current user, never the tenant or customer it belongs to.
/// The server refuses to delete the last tenant administrator and that
/// reason is shown to the user.
Future<void> deleteAccount(
  BuildContext context,
  WidgetRef ref,
  User user,
) async {
  final overlayService = getIt<IOverlayService>();
  final delete = await overlayService.showConfirmDialog(
    content: (_) => DialogContent(
      title: S.of(context).deleteAccount,
      message: S
          .of(context)
          .accountDeletionDialogBody(
            getAuthorityName(context, user).toLowerCase(),
          ),
      cancel: S.of(context).cancel,
    ),
  );
  if (delete != true) {
    return;
  }
  try {
    await getIt<ITbClientService>().client.getUserControllerApi().deleteUser(
      userId: user.id?.id ?? '',
      extra: InterceptorConfig(ignoreErrors: true).toExtra(),
    );
  } catch (e) {
    overlayService.showErrorNotification(
      toThingsboardError(e).getTranslatedMessage,
    );
    return;
  }
  await ref.read(loginProvider.notifier).logout();
}
