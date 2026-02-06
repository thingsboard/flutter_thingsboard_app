import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class DashboardsQueryCtrl extends SearchablePageKeyController<PageLink> {
  DashboardsQueryCtrl() : super(PageLink(20));

  @override
  PageLink nextPageKey(PageLink pageKey) {
    return pageKey.nextPageLink();
  }
  @override
   void onSearchText(String? searchText) {
    final query = value.pageKey;
    query.page = 0;
    query.textSearch = searchText;
    notifyListeners();
  }
}
