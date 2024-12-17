import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_app/modules/notification/repository/notification_pagination_repository.dart';
import 'package:thingsboard_app/modules/notification/repository/notification_repository.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/widgets/filter_segmented_button.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_list.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/ui/back_button_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

enum NotificationsFilter { all, unread }

class NotificationPage extends TbContextWidget {
  NotificationPage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends TbContextState<NotificationPage> {
  NotificationsFilter notificationsFilter = NotificationsFilter.unread;
  late final NotificationPaginationRepository paginationRepository;
  final notificationQueryCtrl = NotificationQueryCtrl();
  late final NotificationRepository notificationRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        leading: BackButtonWidget(
          onPressed: () {
            final navigator = Navigator.of(tbContext.currentState!.context);
            if (navigator.canPop()) {
              tbContext.pop();
            } else {
              tbContext.navigateTo(
                '/main',
                replace: true,
                transition: TransitionType.fadeIn,
                transitionDuration: const Duration(milliseconds: 750),
              );
            }
          },
        ),
        title: const Text('Notifications'),
        actions: [
          TextButton(
            child: Text(
              'Mark all as read',
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
        onRefresh: () async => _refresh(),
        child: StreamBuilder(
          stream: NotificationsLocalService.notificationsNumberStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _refresh();
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
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
                        segments: const [
                          FilterSegments(
                            label: 'Unread',
                            value: NotificationsFilter.unread,
                          ),
                          FilterSegments(
                            label: 'All',
                            value: NotificationsFilter.all,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: NotificationsList(
                        pagingController: paginationRepository.pagingController,
                        thingsboardClient: tbClient,
                        tbContext: tbContext,
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
                          await notificationRepository
                              .markNotificationAsRead(id);
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
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    paginationRepository = NotificationPaginationRepository(
      tbClient: widget.tbContext.tbClient,
      notificationQueryPageCtrl: notificationQueryCtrl,
    )..init();

    notificationRepository = NotificationRepository(
      notificationQueryCtrl: notificationQueryCtrl,
      thingsboardClient: widget.tbContext.tbClient,
    );

    final authority = widget.tbClient.getAuthUser()!.authority;
    final pushNotificationsDisabled = getIt<IFirebaseService>().apps.isEmpty;
    if (pushNotificationsDisabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (authority == Authority.TENANT_ADMIN ||
            authority == Authority.CUSTOMER_USER) {
          showWarnNotification(
            'Push notifications are not configured. '
            'Please contact your system administrator.',
          );
        } else if (authority == Authority.SYS_ADMIN) {
          showWarnNotification(
            'Firebase is not configured.'
            ' Please refer to the official Firebase documentation for'
            ' guidance on how to do so.',
          );
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    paginationRepository.dispose();
    notificationQueryCtrl.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    if (mounted) {
      notificationQueryCtrl.refresh();
    }
  }
}
