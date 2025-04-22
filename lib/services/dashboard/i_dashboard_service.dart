import 'package:thingsboard_app/services/i_service_has_resource.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show HomeDashboardInfo, PageData, PageLink, RequestConfig, DashboardInfo;

abstract interface class IDashboardService implements IServiceHasResource {
  void setHomeDashboard(HomeDashboardInfo? homeDashboard);

  HomeDashboardInfo? getHomeDashboard();

  Future<PageData<DashboardInfo>> getTenantDashboards(
    PageLink pageLink, {
    RequestConfig? config,
  });

  Future<PageData<DashboardInfo>> getCustomerDashboards(
    String customerId,
    PageLink pageLink, {
    RequestConfig? config,
  });
}
