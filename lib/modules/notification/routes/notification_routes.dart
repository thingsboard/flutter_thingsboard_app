import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/notification/notification_page.dart';

class NotificationRoutes extends TbRoutes {
  NotificationRoutes(super.tbContext);

  static const notificationRoutePath = '/notifications';

  late final notificationHandler = Handler(
    handlerFunc: (context, params) {
      return NotificationPage(tbContext);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(notificationRoutePath, handler: notificationHandler);
  }
}
