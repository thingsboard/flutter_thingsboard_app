import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../generated/l10n.dart';

mixin CustomersBase on EntitiesBase<Customer, PageLink> {
  @override
  String get title => S.current.customers_title;

  @override
  String get noItemsFoundText => S.current.customers_not_found;

  @override
  Future<PageData<Customer>> fetchEntities(PageLink pageLink) {
    return tbClient.getCustomerService().getCustomers(pageLink);
  }

  @override
  void onEntityTap(Customer customer) {
    navigateTo('/customer/${customer.id!.id}');
  }
}
