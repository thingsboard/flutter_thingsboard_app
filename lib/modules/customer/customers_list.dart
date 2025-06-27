import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/customer/customers_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class CustomersList extends BaseEntitiesWidget<Customer, PageLink>
    with CustomersBase, ContactBasedBase, EntitiesListStateBase {
  CustomersList(
    super.tbContext,
    super.pageKeyController, {
    super.key,
   super.searchMode,
  });
}
