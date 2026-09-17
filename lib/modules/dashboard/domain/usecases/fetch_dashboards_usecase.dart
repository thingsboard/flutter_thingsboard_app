import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class FetchDashboardsUseCase
    extends UseCase<Future<PageData<DashboardInfo>>, PageLink> {
  const FetchDashboardsUseCase(this.tbClient);

  final ThingsboardClient tbClient;

  @override
  Future<PageData<DashboardInfo>> call(PageLink params) async {
    if (tbClient.isTenantAdmin()) {
      final response = await tbClient
          .getDashboardControllerApi()
          .getTenantDashboards(
            pageSize: params.pageSize,
            page: params.page,
            textSearch: params.textSearch,
            mobile: true,
          );
      final page = response.data!;
      return toPageData(
        page.data,
        page.totalPages,
        page.totalElements,
        page.hasNext,
      );
    } else {
      final response = await tbClient
          .getDashboardControllerApi()
          .getCustomerDashboards(
            customerId: tbClient.getAuthUser()!.customerId!,
            pageSize: params.pageSize,
            page: params.page,
            textSearch: params.textSearch,
            mobile: true,
          );
      final page = response.data!;
      return toPageData(
        page.data,
        page.totalPages,
        page.totalElements,
        page.hasNext,
      );
    }
  }
}
