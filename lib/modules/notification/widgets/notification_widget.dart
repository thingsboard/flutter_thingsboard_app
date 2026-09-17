import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thingsboard_app/locator.dart';

import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/modules/notification/usecase/handle_notification_tap_params.dart';
import 'package:thingsboard_app/modules/notification/usecase/handle_notification_tap_usecase.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_icon.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';

import 'package:timeago/timeago.dart' as timeago;

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    required this.notification,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
    this.isSelectionMode = false,
    this.isSelected = false,
    this.onToggleSelection,
    this.onLongPress,
    super.key,
  });

  final PushNotification notification;
  final ThingsboardClient thingsboardClient;
  final Function(String id, bool readed) onClearNotification;
  final ValueChanged<String> onReadNotification;
  final bool isSelectionMode;
  final bool isSelected;
  final VoidCallback? onToggleSelection;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(notification.createdTime!),
    );
    // PushNotificationInfo.alarmSeverity is the handwritten telemetry enum,
    // while the toColor()/getTranslatedAlarmSeverity() UI extensions live on the
    // built_value AlarmSeverity used across the alarm screens. Bridge by name.
    final severity = _severityFromName(notification.info?.alarmSeverity?.name);

    return InkWell(
      onTap: isSelectionMode
          ? onToggleSelection
          : () {
              getIt<HandleNotificationTapUsecase>().call(
                HandleNotificationTapParams(notification: notification),
              );
            },
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border:
              severity != null ? Border.all(color: severity.toColor()) : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isSelectionMode)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (_) => onToggleSelection?.call(),
                    ),
                  ),
                Column(
                  children: [NotificationIcon(notification: notification)],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              notification.subject,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Flexible(child: Html(data: notification.text)),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      timeago.format(
                        DateTime.now().subtract(diff),
                        locale: 'en_short',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible:
                              notification.status !=
                              PushNotificationStatus.READ,
                          child: SizedBox(
                            width: 30,
                            height: 50,
                            child: isSelectionMode
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.black.withValues(alpha: 0.38),
                                  )
                                : IconButton(
                                    onPressed:
                                        () =>
                                            onReadNotification(notification.id!.id!),
                                    icon: Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.black.withValues(alpha: 0.38),
                                    ),
                                  ),
                          ),
                        ),
                        Visibility(
                          visible:
                              notification.status ==
                              PushNotificationStatus.READ,
                          child: const SizedBox(width: 30, height: 50),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: severity != null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: severity?.toColor().withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          severity?.getTranslatedAlarmSeverity(context) ?? '',
                          style: TextStyle(
                            color: severity?.toColor(),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AlarmSeverity? _severityFromName(String? name) {
    if (name == null) {
      return null;
    }
    try {
      return AlarmSeverity.valueOf(name);
    } catch (_) {
      return null;
    }
  }
}
