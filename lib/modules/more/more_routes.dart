import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/more/more_page.dart';

class MoreRoutes extends TbRoutes {

  MoreRoutes(super.tbContext);
  late final moreHandler = Handler(
    handlerFunc: (context, params) {
      return MorePage(tbContext);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/more', handler: moreHandler);
  }
}
