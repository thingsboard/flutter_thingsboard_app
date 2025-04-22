import 'dart:async' show StreamSubscription;

import 'package:thingsboard_app/services/communication/i_communication_service.dart'
    show GlobalLogoutEvent, ICommunicationService;
import 'package:thingsboard_app/services/dashboard/i_dashboard_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show
        DashboardInfo,
        HomeDashboardInfo,
        PageData,
        PageLink,
        RequestConfig,
        ThingsboardClient;

class DashboardService implements IDashboardService {
  DashboardService({
    required this.communicationService,
    required this.tbClient,
  }) {
    subscription = communicationService.on<GlobalLogoutEvent>().listen((_) {
      homeDashboardInfo = null;
    });
  }

  HomeDashboardInfo? homeDashboardInfo;
  final ICommunicationService communicationService;
  late final StreamSubscription subscription;
  final ThingsboardClient tbClient;

  @override
  void setHomeDashboard(HomeDashboardInfo? homeDashboard) {
    homeDashboardInfo = homeDashboard;
  }

  @override
  Future<void> dispose() {
    return subscription.cancel();
  }

  @override
  HomeDashboardInfo? getHomeDashboard() {
    return homeDashboardInfo;
  }

  @override
  Future<PageData<DashboardInfo>> getCustomerDashboards(
    String customerId,
    PageLink pageLink, {
    RequestConfig? config,
  }) {
    return tbClient.getDashboardService().getCustomerDashboards(
          customerId,
          pageLink,
          mobile: true,
          requestConfig: config,
        );
  }

  @override
  Future<PageData<DashboardInfo>> getTenantDashboards(
    PageLink pageLink, {
    RequestConfig? config,
  }) {
    return tbClient.getDashboardService().getTenantDashboards(
          pageLink,
          mobile: true,
          requestConfig: config,
        );
  }
}
