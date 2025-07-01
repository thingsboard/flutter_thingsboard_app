import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class HandleNotificationTapParams {
  HandleNotificationTapParams(
      {required this.notification, required this.tbContext});

  final PushNotification notification;
  final TbContext tbContext;
}
