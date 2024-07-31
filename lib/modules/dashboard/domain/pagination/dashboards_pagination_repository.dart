import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_query_ctrl.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

final class DashboardsPaginationRepository
    extends PaginationRepository<PageLink, DashboardInfo> {
  DashboardsPaginationRepository({
    required DashboardsQueryCtrl queryController,
    required this.onFetchData,
  }) : super(pageKeyController: queryController);

  final Future<PageData<DashboardInfo>> Function(PageLink query) onFetchData;

  @override
  Future<PageData<DashboardInfo>> fetchPageData(PageLink pageKey) {
    return onFetchData(pageKey);
  }
}
