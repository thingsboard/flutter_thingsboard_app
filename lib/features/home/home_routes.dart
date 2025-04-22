import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/routes/i_tb_routes.dart';
import 'package:thingsboard_app/features/home/home_page.dart';

class HomeRoutes implements ITbRoutes {
  late final homeHandler = Handler(
    handlerFunc: (context, params) {
      return const HomePage();
    },
  );

  @override
  void registerRoutes(FluroRouter router) {
    router.define('/home', handler: homeHandler);
  }
}
