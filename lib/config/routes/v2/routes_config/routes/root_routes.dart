import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/core/auth/login/view/login_page.dart';

final rootRoutes = [
         GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(riderectUrl: null),
    //const Scaffold(body: Center(child: TbProgressIndicator(size: 50,))),
  ),
];
