import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class CustomerDetailsPage extends ContactBasedDetailsPage<Customer> {
  CustomerDetailsPage(String customerId, {super.key})
    : super(
        entityId: customerId,
        defaultTitle: 'Customer',
        subTitle: 'Customer details',
      );
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<Customer?> fetchEntity(String id) async {
    final r = await tbClient.getCustomerControllerApi().getCustomerById(
      customerId: id,
    );
    return r.data;
  }
}
