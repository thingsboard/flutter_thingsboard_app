import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/url/url_page.dart';

class UrlRoutes {
  static const url = '/url';
}

// URL page routes
final urlRoutes = [
  GoRoute(
    path: '${UrlRoutes.url}/:link',

    builder: (context, state) {
      final link = state.pathParameters['link'] ?? '';
      final decodedUrl = Uri.decodeQueryComponent(link);

      return UrlPage(url: decodedUrl);
    },
  ),
];
