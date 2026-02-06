import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/more/profle_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
/// Example of user deletion feature for CE, it's not needed since there is no self registration
/// on CE app
Widget getDeleteButton(BuildContext context, WidgetRef ref, User user) {
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

Future<void> deleteAccount(
  BuildContext context,
  WidgetRef ref,
  User user,
) async {
  final delete = await getIt<IOverlayService>().showConfirmDialog(
    content:
        (_) => DialogContent(
          title: S.of(context).deleteAccount,
          message: S
              .of(context)
              .accountDeletionDialogBody(
                getAuthorityName(context, user).toLowerCase(),
              ),
          cancel: S.of(context).cancel,
        ),
  );
  if (delete == true) {
    final client = getIt<ITbClientService>().client;
    try {
      /// More strict way. Deletes overall tenant account.
      if (user.authority == Authority.TENANT_ADMIN) {
        client.getTenantService().deleteTenant(user.tenantId!.id!);
      }
// You can use this for tenant user's deletion as well, if you want to keep your tenant
      if (user.authority == Authority.CUSTOMER_USER) {
        client.getUserService().deleteUser(user.id!.id!);
      }
      await ref.read(loginProvider.notifier).logout();
    } catch (e) {
      getIt<IOverlayService>().showErrorNotification(
        (_) => S.of(context).cantDeleteUserAccount,
        duration: const Duration(milliseconds: 1500),
      );
    }
  }
}
