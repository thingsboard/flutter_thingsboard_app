import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/widgets/no_notifications_found_widget.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_slidable_widget.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    required this.pagingController,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
    required this.tbContext,
    super.key,
  });

  final ThingsboardClient thingsboardClient;
  final Function(String id, bool read) onClearNotification;
  final ValueChanged<String> onReadNotification;
  final TbContext tbContext;
  final PagingController<PushNotificationQuery, PushNotification>
      pagingController;

  @override
  Widget build(BuildContext context) {
    return PagedListView<PushNotificationQuery, PushNotification>.separated(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return NotificationSlidableWidget(
            notification: item,
            onReadNotification: onReadNotification,
            onClearNotification: onClearNotification,
            tbContext: tbContext,
            thingsboardClient: thingsboardClient,
            child: NotificationWidget(
              notification: item,
              thingsboardClient: thingsboardClient,
              onClearNotification: onClearNotification,
              onReadNotification: onReadNotification,
              tbContext: tbContext,
            ),
          );
        },
        firstPageProgressIndicatorBuilder: (_) => const SizedBox.expand(
          child: ColoredBox(
            color: Color(0x99FFFFFF),
            child: Center(
              child: TbProgressIndicator(
                size: 50.0,
              ),
            ),
          ),
        ),
        noItemsFoundIndicatorBuilder: (_) => const NoNotificationsFoundWidget(),
      ),
      separatorBuilder: (_, _) => const Divider(thickness: 1),
    );
  }
}
