import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class FetchDashboardsUseCase
    extends UseCase<Future<PageData<DashboardInfo>>, PageLink> {
  const FetchDashboardsUseCase(this.tbClient);

  final ThingsboardClient tbClient;

  @override
  Future<PageData<DashboardInfo>> call(PageLink params) {
    if (tbClient.isTenantAdmin()) {
      return tbClient.getDashboardService().getTenantDashboards(
            params,
            mobile: true,
          );
    } else {
      return tbClient.getDashboardService().getCustomerDashboards(
            tbClient.getAuthUser()!.customerId!,
            params,
            mobile: true,
          );
    }
  }
}
