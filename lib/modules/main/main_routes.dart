import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/routes/i_tb_routes.dart';
import 'package:thingsboard_app/modules/main/main_page.dart';

class MainRoutes implements ITbRoutes {
  @override
  void registerRoutes(FluroRouter router) {
    router.define(
      '/main',
      handler: Handler(
        handlerFunc: (context, params) {
          return const MainPage();
        },
      ),
    );
  }
}
