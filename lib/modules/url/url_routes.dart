import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/routes/router.dart';
import 'package:thingsboard_app/modules/url/url_page.dart';

class UrlPageRoutes extends TbRoutes {
  UrlPageRoutes(TbContext tbContext) : super(tbContext);

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
  void doRegisterRoutes(router) {
    router.define(urlPageRoutes, handler: urlPageHandler);
  }
}
