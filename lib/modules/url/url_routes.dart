import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/url/url_page.dart';

class UrlPageRoutes extends TbRoutes {
  UrlPageRoutes(super.tbContext);

  static const urlPageRoutes = '/url/:link';

  late final urlPageHandler = Handler(
    handlerFunc: (context, params) {
      return UrlPage(
        url: Uri.decodeQueryComponent(params['link']?.first ?? ''),
        tbContext: tbContext,
      );
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(urlPageRoutes, handler: urlPageHandler);
  }
}
