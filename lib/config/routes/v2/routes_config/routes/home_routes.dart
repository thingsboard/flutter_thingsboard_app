import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/home/home_page.dart';

class HomeRoutes {
  static const home = '/home';
}

// Root and home routes
final homeRoutes = [

      GoRoute(path: HomeRoutes.home,
 
       builder: (context, state) => const HomePage()),
 
];
