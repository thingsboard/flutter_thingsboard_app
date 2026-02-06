import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class TenantDetailsPage extends ContactBasedDetailsPage<Tenant> {
  TenantDetailsPage(String tenantId, {super.key})
    : super(
        entityId: tenantId,
        defaultTitle: 'Tenant',
        subTitle: 'Tenant details',
      );
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<Tenant?> fetchEntity(String id) {
    return tbClient.getTenantService().getTenant(id);
  }
}
