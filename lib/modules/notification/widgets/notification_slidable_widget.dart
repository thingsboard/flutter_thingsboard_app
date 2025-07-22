import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

class NotificationSlidableWidget extends StatefulWidget {
  const NotificationSlidableWidget({
    required this.child,
    required this.notification,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
    required this.tbContext,
    super.key,
  });

  final Widget child;
  final PushNotification notification;
  final ThingsboardClient thingsboardClient;
  final Function(String id, bool read) onClearNotification;
  final ValueChanged<String> onReadNotification;
  final TbContext tbContext;

  @override
  State<StatefulWidget> createState() => _NotificationSlidableWidget();
}

class _NotificationSlidableWidget extends State<NotificationSlidableWidget> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        height: 134,
        alignment: Alignment.center,
        child: const RefreshProgressIndicator(),
      );
    }

    return Slidable(
      key: ValueKey(widget.notification.id!.id),
      startActionPane:
          widget.notification.status == PushNotificationStatus.READ
              ? null
              : ActionPane(
                extentRatio: 0.3,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed:
                        (context) => widget.onReadNotification(
                          widget.notification.id!.id!,
                        ),
                    backgroundColor: const Color(0xFF198038),
                    foregroundColor: Colors.white,
                    icon: Icons.check_circle_outline,
                    label: S.of(context).markAsRead,
                    borderRadius: BorderRadius.circular(8),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                ],
              ),
      endActionPane: ActionPane(
        extentRatio: _endExtentRatio(widget.notification),
        motion: const ScrollMotion(),
        children: [
          ..._buildAlarmRelatedButtons(widget.notification),
          SlidableAction(
            onPressed: (context) {
              widget.onClearNotification(
                widget.notification.id!.id!,
                widget.notification.status == PushNotificationStatus.READ,
              );
            },
            backgroundColor: const Color(0xFFD12730).withValues(alpha: 0.94),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: S.of(context).delete ,
            borderRadius:
                _buildAlarmRelatedButtons(widget.notification).isEmpty
                    ? BorderRadius.circular(8)
                    : const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
          ),
        ],
      ),
      child: widget.child,
    );
  }

  List<Widget> _buildAlarmRelatedButtons(PushNotification notification) {
    final items = <Widget>[];

    final type = notification.type;
    if (type == PushNotificationType.ALARM) {
      final status = notification.info?.alarmStatus;
      final id = notification.info?.alarmId;

      if (id != null) {
        if ([
          AlarmStatus.CLEARED_UNACK,
          AlarmStatus.ACTIVE_UNACK,
        ].contains(status)) {
          items.add(
            SlidableAction(
              onPressed: (context) => _ackAlarm(id, context),
              backgroundColor: const Color(0xFF198038),
              foregroundColor: Colors.white,
              icon: Icons.done,
              label: S.of(context).acknowledge,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          );
        }

        if ([
          AlarmStatus.ACTIVE_UNACK,
          AlarmStatus.ACTIVE_ACK,
        ].contains(status)) {
          items.add(
            SlidableAction(
              onPressed: (context) => _clearAlarm(id, context),
              backgroundColor: const Color(0xFF757575),
              foregroundColor: Colors.white,
              icon: Icons.clear,
              label: S.of(context).clear ,
              borderRadius:
                  items.isEmpty
                      ? const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      )
                      : BorderRadius.zero,
            ),
          );
        }
      }
    }

    return items;
  }

  Future<void> _ackAlarm(String alarmId, BuildContext context) async {
    final res = await getIt<IOverlayService>().showConfirmDialog(
      content: 
      (_) => DialogContent(title: S.of(context).alarmAcknowledgeTitle, message: S.of(context).alarmAcknowledgeText, ok: S.of(context).yes, cancel: S.of(context).no)
     
    );

    if (res != null && res) {
      setState(() {
        loading = true;
      });
      try {
        await widget.thingsboardClient.getAlarmService().ackAlarm(alarmId);
      } catch (_) {}

      setState(() {
        loading = false;
        widget.onReadNotification(widget.notification.id!.id!);
      });
    }
  }

  Future<void> _clearAlarm(String alarmId, BuildContext context) async {
    final res = await getIt<IOverlayService>().showConfirmDialog(
      content:(_) => DialogContent(title: S.of(context).alarmClearTitle, message: S.of(context).alarmClearText, ok: S.of(context).yes, cancel: S.of(context).no),
      
    );

    if (res != null && res) {
      setState(() {
        loading = true;
      });

      try {
        await widget.thingsboardClient.getAlarmService().clearAlarm(alarmId);
      } catch (_) {}

      setState(() {
        loading = false;
        widget.onReadNotification(widget.notification.id!.id!);
      });
    }
  }

  double _endExtentRatio(PushNotification notification) {
    final items = _buildAlarmRelatedButtons(notification);
    if (items.isEmpty) {
      return 0.27;
    } else if (items.length == 1) {
      return 0.53;
    }

    return 0.8;
  }
}
