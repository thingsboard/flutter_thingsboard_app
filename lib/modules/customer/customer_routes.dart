import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'customer_details_page.dart';
import 'customers_page.dart';

class CustomerRoutes extends TbRoutes {
  late var customersHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var searchMode = params['search']?.first == 'true';
    return CustomersPage(tbContext, searchMode: searchMode);
  });

  late var customerDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CustomerDetailsPage(tbContext, params["id"][0]);
  });

  CustomerRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/customers", handler: customersHandler);
    router.define("/customer/:id", handler: customerDetailsHandler);
  }
}
