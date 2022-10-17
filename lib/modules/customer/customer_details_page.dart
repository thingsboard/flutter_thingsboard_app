import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../generated/l10n.dart';

class CustomerDetailsPage extends ContactBasedDetailsPage<Customer> {
  CustomerDetailsPage(TbContext tbContext, String customerId)
      : super(tbContext,
            entityId: customerId,
            defaultTitle: S.current.customer_title,
            subTitle: S.current.customer_subtitle);

  @override
  Future<Customer?> fetchEntity(String customerId) {
    return tbClient.getCustomerService().getCustomer(customerId);
  }
}
