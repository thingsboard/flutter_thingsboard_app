import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class CustomerDetailsPage extends ContactBasedDetailsPage<Customer> {
  CustomerDetailsPage(super.tbContext, String customerId, {super.key})
      : super(
          entityId: customerId,
          defaultTitle: 'Customer',
          subTitle: 'Customer details',
        );

  @override
  Future<Customer?> fetchEntity(String id) {
    return tbClient.getCustomerService().getCustomer(id);
  }
}
