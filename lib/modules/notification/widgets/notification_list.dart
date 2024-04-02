import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/widgets/no_notifications_found_widget.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_slidable_widget.dart';
import 'package:thingsboard_app/modules/notification/widgets/notification_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationsList extends StatelessWidget {
  NotificationsList({
    required this.pagingController,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
    required this.tbContext,
  });

  final ThingsboardClient thingsboardClient;
  final Function(String id, bool read) onClearNotification;
  final ValueChanged<String> onReadNotification;
  final TbContext tbContext;
  final PagingController pagingController;

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return NotificationSlidableWidget(
            child: NotificationWidget(
              notification: item as PushNotification,
              thingsboardClient: thingsboardClient,
              onClearNotification: onClearNotification,
              onReadNotification: onReadNotification,
              tbContext: tbContext,
            ),
            notification: item,
            onReadNotification: onReadNotification,
            onClearNotification: onClearNotification,
            tbContext: tbContext,
            thingsboardClient: thingsboardClient,
          );
        },
        firstPageProgressIndicatorBuilder: (_) => SizedBox.expand(
          child: Container(
            color: const Color(0x99FFFFFF),
            child: const Center(
              child: TbProgressIndicator(
                size: 50.0,
              ),
            ),
          ),
        ),
        noItemsFoundIndicatorBuilder: (_) => const NoNotificationsFoundWidget(),
      ),
      separatorBuilder: (_, __) => const Divider(thickness: 1),
    );
  }
}
