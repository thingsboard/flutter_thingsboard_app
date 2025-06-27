import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart';
import 'package:thingsboard_app/modules/version/view/update_required_page.dart';

class VersionRoutes extends TbRoutes {
  VersionRoutes(super.tbContext);

  static const updateRequiredRoutePath = '/updateRequired';

  late final updateRequiredHandler = Handler(
    handlerFunc: (context, params) {
      final args = context!.settings!.arguments! as VersionRouteArguments;
      return UpdateRequiredPage(tbContext, arguments: args);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(updateRequiredRoutePath, handler: updateRequiredHandler);
  }
}
