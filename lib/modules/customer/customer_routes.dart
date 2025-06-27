import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';

import 'package:thingsboard_app/modules/customer/customer_details_page.dart';
import 'package:thingsboard_app/modules/customer/customers_page.dart';

class CustomerRoutes extends TbRoutes {
  CustomerRoutes(super.tbContext);
  late final customersHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      final searchMode = params['search']?.first == 'true';
      return CustomersPage(tbContext, searchMode: searchMode);
    },
  );

  late final customerDetailsHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      return CustomerDetailsPage(tbContext, params['id']!.first);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/customers', handler: customersHandler);
    router.define('/customer/:id', handler: customerDetailsHandler);
  }
}
