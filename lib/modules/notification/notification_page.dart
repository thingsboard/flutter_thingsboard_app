import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_app/modules/notification/di/notifcations_di.dart';
import 'package:thingsboard_app/modules/notification/repository/notification_pagination_repository.dart';
import 'package:thingsboard_app/modules/notification/repository/notification_repository.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/widgets/filter_segmented_button.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_list.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

enum NotificationsFilter { all, unread }

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationsFilter notificationsFilter = NotificationsFilter.unread;
  late final NotificationPaginationRepository paginationRepository;
  final notificationQueryCtrl = NotificationQueryCtrl();
  late final NotificationRepository notificationRepository;
  final overlayService = getIt<IOverlayService>();
  late final StreamSubscription<int> listener;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        title: Text(S.of(context).notifications(2)),
        actions: [
          TextButton(
            child: Text(
              S.of(context).markAllAsRead,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () async {
              await notificationRepository.markAllAsRead();

              if (mounted) {
                notificationQueryCtrl.refresh();
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: FilterSegmentedButton(
                    selected: notificationsFilter,
                    onSelectionChanged: (newSelection) {
                      if (notificationsFilter == newSelection) {
                        return;
                      }

                      setState(() {
                        notificationsFilter = newSelection;

                        notificationRepository.filterByReadStatus(
                          notificationsFilter == NotificationsFilter.unread,
                        );
                      });
                    },
                    segments: [
                      FilterSegments(
                        label: S.of(context).unread,
                        value: NotificationsFilter.unread,
                      ),
                      FilterSegments(
                        label: S.of(context).all,
                        value: NotificationsFilter.all,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: NotificationsList(
                    pagingController: paginationRepository.pagingController,
                    thingsboardClient: getIt<ITbClientService>().client,
                    onClearNotification: (id, read) async {
                      await notificationRepository.deleteNotification(id);
                      if (!read) {
                        await notificationRepository
                            .decreaseNotificationBadgeCount();
                      }

                      if (mounted) {
                        notificationQueryCtrl.refresh();
                      }
                    },
                    onReadNotification: (id) async {
                      await notificationRepository.markNotificationAsRead(id);
                      await notificationRepository
                          .decreaseNotificationBadgeCount();

                      if (mounted) {
                        notificationQueryCtrl.refresh();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    paginationRepository = NotificationPaginationRepository(
      tbClient: getIt<ITbClientService>().client,
      notificationQueryPageCtrl: notificationQueryCtrl,
    )..init();
    NotifcationsDi.init();
    notificationRepository = NotificationRepository(
      notificationQueryCtrl: notificationQueryCtrl,
      thingsboardClient: getIt<ITbClientService>().client,
    );

    final authority = getIt<ITbClientService>().client.getAuthUser()!.authority;
    final pushNotificationsDisabled = getIt<IFirebaseService>().apps.isEmpty;
    if (pushNotificationsDisabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (authority == Authority.TENANT_ADMIN ||
            authority == Authority.CUSTOMER_USER) {
          overlayService.showWarnNotification(
            (context) =>
                S
                    .of(context)
                    .pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator,
          );
        } else if (authority == Authority.SYS_ADMIN) {
          overlayService.showWarnNotification(
            (context) =>
                S
                    .of(context)
                    .firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase,
          );
        }
      });
    }
    listener = NotificationsLocalService.notificationsNumberStream.stream
        .listen((e) {
          //  _refresh();
        });
    super.initState();
  }

  @override
  void dispose() {
    paginationRepository.dispose();
    notificationQueryCtrl.dispose();
    NotifcationsDi.dispose();
    listener.cancel();
    getIt<IOverlayService>().hideNotification();
    super.dispose();
  }

  Future<void> _refresh() async {
    if (mounted) {
      notificationQueryCtrl.refresh();
    }
  }
}
