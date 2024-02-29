import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/notification_model.dart';
import 'package:thingsboard_app/modules/notification/notification_widget.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class NotificationsList extends StatelessWidget {
  NotificationsList({
    required this.notifications,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
    required this.tbContext,
  });

  final List<NotificationModel> notifications;
  final ThingsboardClient thingsboardClient;
  final ValueChanged<String> onClearNotification;
  final ValueChanged<String> onReadNotification;
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return LayoutBuilder(
        builder: (_, c) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: c.maxWidth,
            height: c.maxHeight,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No notifications found',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: notifications.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          NotificationService.handleClickOnNotification(
            notifications[index].message.data,
            tbContext,
          );
        },
        child: NotificationWidget(
          notification: notifications[index],
          thingsboardClient: thingsboardClient,
          onClearNotification: onClearNotification,
          onReadNotification: onReadNotification,
        ),
      ),
      separatorBuilder: (_, __) => const Divider(thickness: 1),
    );
  }
}
