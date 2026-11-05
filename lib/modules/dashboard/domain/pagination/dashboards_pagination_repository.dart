import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

final class DashboardsPaginationRepository
    extends SearchablePaginationRepository<PageLink, DashboardInfo> {
  DashboardsPaginationRepository({
    required super.queryController,
    required this.onFetchData,
  });

  final Future<PageData<DashboardInfo>> Function(PageLink query) onFetchData;

  @override
  Future<PageData<DashboardInfo>> fetchPageData(PageLink pageKey) {
    return onFetchData(pageKey);
  }
}

abstract base class SearchablePaginationRepository<Type, Item>
    extends PaginationRepository<Type, Item> {
  SearchablePaginationRepository({
    required SearchablePageKeyController<Type> queryController,
  }) : _ct = queryController,
       super(pageKeyController: queryController);
  final SearchablePageKeyController<Type> _ct;
  void search(String? data) {
    return _ct.onSearchText(data);
  }
}

abstract class SearchablePageKeyController<T> extends PageKeyController<T> {
  SearchablePageKeyController(super.initialPageKey);

  void onSearchText(String? searchText);
}
