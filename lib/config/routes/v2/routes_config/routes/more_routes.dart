import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/more/more_page.dart';

class MoreRoutes {
  static const more = '/more';
}

// More routes
final List<GoRoute> moreRoutes = [
  GoRoute(
    path: MoreRoutes.more,
    builder: (context, state) {
      return const MorePage();
    },
    
  ),
];
