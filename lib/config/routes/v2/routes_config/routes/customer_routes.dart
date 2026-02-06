import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/modules/customer/customer_details_page.dart';
import 'package:thingsboard_app/modules/customer/customers_page.dart';

class CustomerRoutes{
  static const customers = '/customers';
  static const customer = '/customer';
}
// Customer management routes
final customerRoutes = [
  GoRoute(
    path: CustomerRoutes.customers,
    builder: (context, state) {
      final searchMode = state.uri.queryParameters['search'] == 'true';

      return CustomersPage(searchMode: searchMode);
    },
    routes: [
      GoRoute(
           parentNavigatorKey: globalNavigatorKey,
        path: '${CustomerRoutes.customer}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;

          return CustomerDetailsPage(id);
        },
      ),
    ],
  ),
];
