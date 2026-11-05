import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
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

  bool isSelectionMode = false;
  Set<String> selectedIds = {};
  bool isProcessing = false;
  bool _cancelRequested = false;
  int processedCount = 0;
  int totalToProcess = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isSelectionMode,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && isSelectionMode) {
          _exitSelectionMode();
        }
      },
      child: Scaffold(
        appBar: isSelectionMode ? _buildSelectionAppBar() : _buildNormalAppBar(),
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

                        _exitSelectionMode();
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
                      isSelectionMode: isSelectionMode,
                      selectedIds: selectedIds,
                      onToggleSelection: _toggleSelection,
                      onLongPress: _enterSelectionMode,
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
        bottomNavigationBar:
            isSelectionMode ? _buildSelectionActionBar() : null,
      ),
    );
  }

  TbAppBar _buildNormalAppBar() {
    return TbAppBar(
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
    );
  }

  TbAppBar _buildSelectionAppBar() {
    final allSelected = _allSelected;
    return TbAppBar(
      canGoBack: false,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: _exitSelectionMode,
      ),
      title: Text(S.of(context).nSelected(selectedIds.length)),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: allSelected,
              onChanged: (_) {
                if (allSelected) {
                  _exitSelectionMode();
                } else {
                  _selectAll();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  if (allSelected) {
                    _exitSelectionMode();
                  } else {
                    _selectAll();
                  }
                },
                child: Text(
                  S.of(context).selectAll,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionActionBar() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isProcessing)
            LinearProgressIndicator(
              value: totalToProcess > 0 ? processedCount / totalToProcess : null,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed:
                        isProcessing || selectedIds.isEmpty
                            ? null
                            : _batchDelete,
                    icon: const Icon(Icons.delete_outline),
                    label: Text(S.of(context).delete),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.notificationError,
                      side: BorderSide(
                        color:
                            isProcessing || selectedIds.isEmpty
                                ? Colors.grey.shade300
                                : AppColors.notificationError,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed:
                        isProcessing || selectedIds.isEmpty || !_hasUnreadSelected
                            ? null
                            : _batchMarkAsRead,
                    icon: const Icon(Icons.check_circle_outline),
                    label: Text(S.of(context).markAsRead),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.notificationSuccess,
                      side: BorderSide(
                        color:
                            isProcessing || selectedIds.isEmpty || !_hasUnreadSelected
                                ? Colors.grey.shade300
                                : AppColors.notificationSuccess,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _enterSelectionMode(String id) {
    if (isSelectionMode) return;
    setState(() {
      isSelectionMode = true;
      selectedIds = {id};
    });
  }

  void _exitSelectionMode() {
    if (!isSelectionMode) return;
    setState(() {
      isSelectionMode = false;
      selectedIds = {};
      if (isProcessing) {
        _cancelRequested = true;
      }
    });
  }

  void _toggleSelection(String id) {
    setState(() {
      if (selectedIds.contains(id)) {
        selectedIds.remove(id);
        if (selectedIds.isEmpty) {
          isSelectionMode = false;
        }
      } else {
        selectedIds.add(id);
      }
    });
  }

  void _selectAll() {
    final items = paginationRepository.pagingController.itemList;
    if (items == null || items.isEmpty) return;
    setState(() {
      selectedIds = items.map((n) => n.id!.id).toSet();
    });
  }

  bool get _allSelected {
    final items = paginationRepository.pagingController.itemList;
    if (items == null || items.isEmpty) return false;
    return selectedIds.length == items.length;
  }

  bool get _hasUnreadSelected {
    final items = paginationRepository.pagingController.itemList;
    if (items == null || items.isEmpty) return false;
    return items.any(
      (n) =>
          selectedIds.contains(n.id!.id) &&
          n.status != NotificationStatus.READ,
    );
  }

  Future<void> _batchDelete() async {
    final count = selectedIds.length;
    final confirmed = await overlayService.showConfirmDialog(
      content: (_) => DialogContent(
        title: S.of(context).areYouSure,
        message: S.of(context).deleteSelectedNotifications(count),
        ok: S.of(context).delete,
        cancel: S.of(context).no,
      ),
    );
    if (confirmed != true) return;

    final items = paginationRepository.pagingController.itemList ?? [];
    final toDelete =
        items.where((n) => selectedIds.contains(n.id!.id)).toList();

    setState(() {
      isProcessing = true;
      processedCount = 0;
      totalToProcess = toDelete.length;
    });

    int unreadCount = 0;
    int failCount = 0;
    for (final notification in toDelete) {
      if (_cancelRequested) break;
      try {
        await notificationRepository.deleteNotification(notification.id!.id);
        if (notification.status != NotificationStatus.READ) {
          unreadCount++;
        }
      } catch (_) {
        failCount++;
      }
      if (mounted) setState(() => processedCount++);
    }

    for (int i = 0; i < unreadCount; i++) {
      await notificationRepository.decreaseNotificationBadgeCount();
    }

    if (mounted) {
      if (!_cancelRequested) {
        _exitSelectionMode();
      }
      setState(() {
        isProcessing = false;
        _cancelRequested = false;
      });
      notificationQueryCtrl.refresh();

      if (failCount > 0) {
        overlayService.showWarnNotification(
          (_) => S.of(context).failedToPerformOperation(failCount),
        );
      }
    }
  }

  Future<void> _batchMarkAsRead() async {
    final items = paginationRepository.pagingController.itemList ?? [];
    final toMark = items
        .where(
          (n) =>
              selectedIds.contains(n.id!.id) &&
              n.status != NotificationStatus.READ,
        )
        .toList();

    final confirmed = await overlayService.showConfirmDialog(
      content: (_) => DialogContent(
        title: S.of(context).areYouSure,
        message: S.of(context).markSelectedNotificationsAsRead(toMark.length),
        ok: S.of(context).markAsRead,
        cancel: S.of(context).no,
      ),
    );
    if (confirmed != true) return;

    setState(() {
      isProcessing = true;
      processedCount = 0;
      totalToProcess = toMark.length;
    });

    int failCount = 0;
    for (final notification in toMark) {
      if (_cancelRequested) break;
      try {
        await notificationRepository
            .markNotificationAsRead(notification.id!.id);
        await notificationRepository.decreaseNotificationBadgeCount();
      } catch (_) {
        failCount++;
      }
      if (mounted) setState(() => processedCount++);
    }

    if (mounted) {
      if (!_cancelRequested) {
        _exitSelectionMode();
      }
      setState(() {
        isProcessing = false;
        _cancelRequested = false;
      });
      notificationQueryCtrl.refresh();

      if (failCount > 0) {
        overlayService.showWarnNotification(
          (_) => S.of(context).failedToPerformOperation(failCount),
        );
      }
    }
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
    _exitSelectionMode();
    if (mounted) {
      notificationQueryCtrl.refresh();
    }
  }
}
