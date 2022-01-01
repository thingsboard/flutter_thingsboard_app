import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin CustomersBase on EntitiesBase<Customer, PageLink> {
  @override
  String get title => 'Customers';

  @override
  String get noItemsFoundText => 'No customers found';

  @override
  Future<PageData<Customer>> fetchEntities(PageLink pageLink) {
    return tbClient.getCustomerService().getCustomers(pageLink);
  }

  @override
  void onEntityTap(Customer customer) {
    navigateTo('/customer/${customer.id!.id}');
  }
}
