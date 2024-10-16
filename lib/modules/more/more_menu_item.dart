import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';

class MoreMenuItem {
  final String title;
  final IconData icon;
  final String path;
  final bool showAdditionalIcon;
  final Widget? additionalIcon;
  final bool disabled;
  final String? disabledReasonMessage;

  MoreMenuItem({
    required this.title,
    required this.icon,
    required this.path,
    this.showAdditionalIcon = false,
    this.additionalIcon,
    this.disabled = false,
    this.disabledReasonMessage,
  });

  static List<MoreMenuItem> getItems(
    TbContext tbContext,
    BuildContext context,
  ) {
    if (tbContext.isAuthenticated) {
      List<MoreMenuItem> items = [];
      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.TENANT_ADMIN:
          items.addAll([
            MoreMenuItem(
              title: S.of(context).customers,
              icon: Icons.supervisor_account,
              path: '/customers',
            ),
            MoreMenuItem(
              title: S.of(context).assets,
              icon: Icons.domain,
              path: '/assets',
            ),
            MoreMenuItem(
              title: S.of(context).auditLogs,
              icon: Icons.track_changes,
              path: '/auditLogs',
            ),
          ]);
          break;
        case Authority.CUSTOMER_USER:
          items.addAll([
            MoreMenuItem(
              title: S.of(context).assets,
              icon: Icons.domain,
              path: '/assets',
            ),
          ]);
          break;
        case Authority.SYS_ADMIN:
        case Authority.REFRESH_TOKEN:
        case Authority.ANONYMOUS:
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }
      return items;
    } else {
      return [];
    }
  }

  static MoreMenuItem? getNotificationMenuItem(TbContext tbContext) {
    if (tbContext.isAuthenticated) {
      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          return MoreMenuItem(
            title: 'Notifications',
            icon: Icons.notifications_active,
            path: '/notifications',
            showAdditionalIcon: true,
            additionalIcon: _notificationNumberWidget(tbContext.tbClient),
            disabled: getIt<IFirebaseService>().apps.isEmpty,
            disabledReasonMessage: 'Firebase is not configured.'
                ' Please refer to the official Firebase documentation for'
                ' guidance on how to do so.',
          );

        case Authority.TENANT_ADMIN:
        case Authority.CUSTOMER_USER:
          return MoreMenuItem(
            title: 'Notifications',
            icon: Icons.notifications_active,
            path: '/notifications',
            showAdditionalIcon: true,
            additionalIcon: _notificationNumberWidget(tbContext.tbClient),
            disabled: getIt<IFirebaseService>().apps.isEmpty,
            disabledReasonMessage: 'Notifications are not configured. '
                'Please contact your system administrator.',
          );

        case Authority.REFRESH_TOKEN:
        case Authority.ANONYMOUS:
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }
    }

    return null;
  }

  static Widget _notificationNumberWidget(ThingsboardClient tbClient) {
    if (getIt<IFirebaseService>().apps.isNotEmpty) {
      NotificationService().updateNotificationsCount();
    }

    return StreamBuilder<int>(
      stream: NotificationsLocalService.notificationsNumberStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            height: 20,
            width: 20,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '${snapshot.data! > 99 ? '99+' : snapshot.data}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return const SizedBox(width: 20);
      },
    );
  }
}
