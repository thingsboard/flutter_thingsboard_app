import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract base class PaginationRepository<T, B> {
  PaginationRepository({
    required this.pageKeyController,
  }) {
    init();
  }

  late final PagingController<T, B> pagingController;
  final PageKeyController<T> pageKeyController;

  void init() {
    pagingController = PagingController(
      firstPageKey: pageKeyController.value.pageKey,
    );

    pageKeyController.addListener(_didChangePageKeyValue);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  void dispose() {
    pageKeyController.removeListener(_didChangePageKeyValue);
    pagingController.dispose();
  }

  void refresh() {
    _fetchPage(pagingController.firstPageKey, refresh: true);
  }

  Future<PageData<B>> fetchPageData(T pageKey);

  Future<void> _fetchPage(
    T pageKey, {
    bool refresh = false,
  }) async {
    try {
      final pageData = await fetchPageData(pageKey);

      final isLastPage = !pageData.hasNext;
      if (refresh) {
        final state = pagingController.value;
        if (state.itemList != null) {
          state.itemList!.clear();
        }
      }
      if (isLastPage) {
        pagingController.appendLastPage(pageData.data);
      } else {
        final nextPageKey = pageKeyController.nextPageKey(pageKey);
        pagingController.appendPage(pageData.data, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void _didChangePageKeyValue() {
    _refreshPagingController();
  }

  void _refreshPagingController() {
    _fetchPage(pageKeyController.value.pageKey, refresh: true);
  }
}
