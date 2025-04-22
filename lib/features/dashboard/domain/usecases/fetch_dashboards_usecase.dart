import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class FetchDashboardsUseCase
    extends UseCase<Future<PageData<DashboardInfo>>, PageLink> {
  const FetchDashboardsUseCase(this.tbClientService);

  final ITbClientService tbClientService;

  @override
  Future<PageData<DashboardInfo>> call(PageLink params) {
    if (tbClientService.isTenantAdmin()) {
      return tbClientService.dashboardService.getTenantDashboards(params);
    } else {
      return tbClientService.dashboardService.getCustomerDashboards(
        tbClientService.getAuthUser()!.customerId!,
        params,
      );
    }
  }
}
