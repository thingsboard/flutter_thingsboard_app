import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MorePage extends TbContextWidget {
  MorePage(TbContext tbContext) : super(tbContext);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle,
                          size: 48, color: Color(0xFFAFAFAF)),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.settings, color: Color(0xFFAFAFAF)),
                          onPressed: () async {
                            await navigateTo('/profile');
                            setState(() {});
                          })
                    ],
                  ),
                  SizedBox(height: 22),
                  Text(_getUserDisplayName(),
                      style: TextStyle(
                          color: Color(0xFF282828),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          height: 23 / 20)),
                  SizedBox(height: 2),
                  Text(_getAuthorityName(context),
                      style: TextStyle(
                          color: Color(0xFFAFAFAF),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          height: 16 / 14)),
                  SizedBox(height: 24),
                  Divider(color: Color(0xFFEDEDED)),
                  SizedBox(height: 8),
                  buildMoreMenuItems(context),
                  SizedBox(height: 8),
                  Divider(color: Color(0xFFEDEDED)),
                  SizedBox(height: 8),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                          height: 48,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 18),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.logout,
                                        color: Color(0xFFE04B2F)),
                                    SizedBox(width: 34),
                                    Text('${S.of(context).logout}',
                                        style: TextStyle(
                                            color: Color(0xFFE04B2F),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 20 / 14))
                                  ]))),
                      onTap: () {
                        tbContext.logout(
                            requestConfig: RequestConfig(ignoreErrors: true));
                      })
                ],
              ),
            )));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      NotificationService().updateNotificationsCount();
    }
  }

  Widget buildMoreMenuItems(BuildContext context) {
    List<Widget> items =
        MoreMenuItem.getItems(tbContext, context).map((menuItem) {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
              height: 48,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Icon(
                      menuItem.icon,
                      color: !menuItem.disabled
                          ? Color(0xFF282828)
                          : Colors.grey.withOpacity(0.5),
                    ),
                    Visibility(
                      visible: menuItem.showAdditionalIcon,
                      child: menuItem.additionalIcon ?? const SizedBox.shrink(),
                    ),
                    SizedBox(width: menuItem.showAdditionalIcon ? 15 : 34),
                    Text(menuItem.title,
                        style: TextStyle(
                            color: !menuItem.disabled
                                ? Color(0xFF282828)
                                : Colors.grey.withOpacity(0.5),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 20 / 14))
                  ]))),
          onTap: () {
            if (!menuItem.disabled) {
              navigateTo(menuItem.path);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    menuItem.disabledReasonMessage ?? 'The item is disabled',
                  ),
                ),
              );
            }
          });
    }).toList();
    return Column(children: items);
  }

  String _getUserDisplayName() {
    var user = tbContext.userDetails;
    var name = '';
    if (user != null) {
      if ((user.firstName != null && user.firstName!.isNotEmpty) ||
          (user.lastName != null && user.lastName!.isNotEmpty)) {
        if (user.firstName != null) {
          name += user.firstName!;
        }
        if (user.lastName != null) {
          if (name.isNotEmpty) {
            name += ' ';
          }
          name += user.lastName!;
        }
      } else {
        name = user.email;
      }
    }
    return name;
  }

  String _getAuthorityName(BuildContext context) {
    var user = tbContext.userDetails;
    var name = '';
    if (user != null) {
      var authority = user.authority;
      switch (authority) {
        case Authority.SYS_ADMIN:
          name = '${S.of(context).systemAdministrator}';
          break;
        case Authority.TENANT_ADMIN:
          name = '${S.of(context).tenantAdministrator}';
          break;
        case Authority.CUSTOMER_USER:
          name = '${S.of(context).customer}';
          break;
        default:
          break;
      }
    }
    return name;
  }
}

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
      TbContext tbContext, BuildContext context) {
    if (tbContext.isAuthenticated) {
      List<MoreMenuItem> items = [];
      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          items.add(
            MoreMenuItem(
              title: 'Notifications',
              icon: Icons.notifications_active,
              path: '/notifications',
              showAdditionalIcon: true,
              additionalIcon: _notificationNumberWidget(tbContext.tbClient),
              disabled: Firebase.apps.isEmpty,
              disabledReasonMessage: 'Firebase is not configured.'
                  ' Please refer to the official Firebase documentation for'
                  ' guidance on how to do so.',
            ),
          );
          break;
        case Authority.TENANT_ADMIN:
          items.addAll([
            MoreMenuItem(
                title: '${S.of(context).customers}',
                icon: Icons.supervisor_account,
                path: '/customers'),
            MoreMenuItem(
                title: '${S.of(context).assets}',
                icon: Icons.domain,
                path: '/assets'),
            MoreMenuItem(
                title: '${S.of(context).auditLogs}',
                icon: Icons.track_changes,
                path: '/auditLogs'),
            MoreMenuItem(
              title: 'Notifications',
              icon: Icons.notifications_active,
              path: '/notifications',
              showAdditionalIcon: true,
              additionalIcon: _notificationNumberWidget(tbContext.tbClient),
              disabled: Firebase.apps.isEmpty,
              disabledReasonMessage: 'Notifications are not configured. '
                  'Please contact your system administrator.',
            )
          ]);
          break;
        case Authority.CUSTOMER_USER:
          items.addAll([
            MoreMenuItem(
                title: '${S.of(context).assets}',
                icon: Icons.domain,
                path: '/assets'),
            MoreMenuItem(
              title: 'Notifications',
              icon: Icons.notifications_active,
              path: '/notifications',
              showAdditionalIcon: true,
              additionalIcon: _notificationNumberWidget(tbContext.tbClient),
              disabled: Firebase.apps.isEmpty,
              disabledReasonMessage: 'Notifications are not configured. '
                  'Please contact your system administrator.',
            ),
          ]);
          break;
        case Authority.REFRESH_TOKEN:
          break;
        case Authority.ANONYMOUS:
          break;
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }
      return items;
    } else {
      return [];
    }
  }

  static Widget _notificationNumberWidget(ThingsboardClient tbClient) {
    NotificationsLocalService().triggerNotificationCountStream();

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
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return const SizedBox(width: 20);
      },
    );
  }
}
