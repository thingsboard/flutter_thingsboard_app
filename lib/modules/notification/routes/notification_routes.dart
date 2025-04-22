import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/routes/router.dart';
import 'package:thingsboard_app/modules/notification/notification_page.dart';

class NotificationRoutes extends TbRoutes {
  NotificationRoutes(TbContext tbContext) : super(tbContext);

  static const notificationRoutePath = '/notifications';

  late final notificationHandler = Handler(
    handlerFunc: (context, params) {
      return NotificationPage(tbContext);
    },
  );

  @override
  void doRegisterRoutes(router) {
    router.define(notificationRoutePath, handler: notificationHandler);
  }
}
