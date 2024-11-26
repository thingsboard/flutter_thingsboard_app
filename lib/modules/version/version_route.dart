import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/version/update_required_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class VersionRoutes extends TbRoutes {
  VersionRoutes(TbContext tbContext) : super(tbContext);

  static const updateRequiredRoutePath = '/updateRequired';

  late final updateRequiredHandler = Handler(
    handlerFunc: (context, params) {
      final versionInfo = context?.settings?.arguments as VersionInfo;

      return UpdateRequiredPage(tbContext, versionInfo: versionInfo);
    },
  );

  @override
  void doRegisterRoutes(router) {
    router.define(updateRequiredRoutePath, handler: updateRequiredHandler);
  }
}
