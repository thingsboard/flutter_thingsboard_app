import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/notification/notification_model.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    required this.notification,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
  });

  final NotificationModel notification;
  final ThingsboardClient thingsboardClient;
  final ValueChanged<String> onClearNotification;
  final ValueChanged<String> onReadNotification;

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(notification.message.sentTime!);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.grey,
        // ),
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
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.black54,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          notification.message.notification?.title ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          notification.message.notification?.body ?? '',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    child: Text(
                      timeago.format(
                        DateTime.now().subtract(diff),
                        locale: 'en_short',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: !notification.read,
                        child: SizedBox(
                          width: 30,
                          height: 50,
                          child: IconButton(
                            onPressed: () => onReadNotification(
                              notification.message.messageId!,
                            ),
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 50,
                        child: IconButton(
                          onPressed: () => onClearNotification(
                            notification.message.messageId!,
                          ),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: alarmSeverityColors[AlarmSeverity.CRITICAL]!
                  //         .withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   padding: const EdgeInsets.all(5),
                  //   child: Text(
                  //     'Critical',
                  //     style: TextStyle(
                  //       color: alarmSeverityColors[AlarmSeverity.CRITICAL]!,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
