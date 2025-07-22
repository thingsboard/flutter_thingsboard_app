import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
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
    required this.tbContext,
    super.key,
  });

  final PushNotification notification;
  final ThingsboardClient thingsboardClient;
  final Function(String id, bool readed) onClearNotification;
  final ValueChanged<String> onReadNotification;
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(notification.createdTime!),
    );

    final severity = notification.info?.alarmSeverity;

    return InkWell(
      onTap: () {
        getIt<HandleNotificationTapUsecase>().call(
          HandleNotificationTapParams(
            notification: notification,
            tbContext: tbContext,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border:
              notification.info?.alarmSeverity != null
                  ? Border.all(
                    color:
                       notification.info?.alarmSeverity?.toColor() ?? Colors.transparent,
                  )
                  : null,
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
                            child: IconButton(
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
                          color: severity?.toColor().withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                         severity?.getTranslatedAlarmSeverity(context) ?? '',
                          style: TextStyle(
                            color: AlarmSeverity.CRITICAL.toColor(),
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
}
