// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// Loads one page for [pageKey]; [refresh] is true for a pull-to-refresh.
typedef FetchPageData<P, T> =
    Future<PageData<T>> Function(P pageKey, {required bool refresh});

/// A [PagingController] over the app's [PageKeyController] and
/// [PageData]-returning fetches.
///
/// - The first page uses the page key controller's current key, so search
///   text and filters set since the controller was created apply.
/// - The list ends when a page reports `hasNext == false`.
/// - [reloadFirstPage] replaces the loaded pages with a fresh first page
///   without clearing the list first (pull-to-refresh); [refresh] resets the
///   list and loads it again (new search or filter).
class PageDataPagingController<P, T> extends PagingController<P, T> {
  factory PageDataPagingController({
    required PageKeyController<P> pageKeyController,
    required FetchPageData<P, T> fetchPageData,
  }) => PageDataPagingController.withKeys(
    pageKeys: () => pageKeyController,
    fetchPageData: fetchPageData,
  );

  /// For a widget whose page key controller can be replaced on rebuild:
  /// [pageKeys] is read on every page request.
  factory PageDataPagingController.withKeys({
    required PageKeyController<P> Function() pageKeys,
    required FetchPageData<P, T> fetchPageData,
  }) => PageDataPagingController._(_HasMore(), pageKeys, fetchPageData);

  PageDataPagingController._(
    _HasMore hasMore,
    PageKeyController<P> Function() pageKeys,
    FetchPageData<P, T> fetchPageData,
  ) : _hasMore = hasMore,
      _pageKeys = pageKeys,
      _fetchPageData = fetchPageData,
      super(
        getNextPageKey: (state) {
          final lastKey = state.keys?.lastOrNull;
          if (lastKey == null) {
            return pageKeys().value.pageKey;
          }
          return hasMore.value ? pageKeys().nextPageKey(lastKey) : null;
        },
        fetchPage: (pageKey) async {
          final pageData = await fetchPageData(pageKey, refresh: false);
          hasMore.value = pageData.hasNext;
          return pageData.data;
        },
      );

  final _HasMore _hasMore;
  final PageKeyController<P> Function() _pageKeys;
  final FetchPageData<P, T> _fetchPageData;

  /// Ends the list as soon as a page reports no next page, instead of after
  /// one more page request (infinite_scroll_pagination 5 only learns it from
  /// getNextPageKey), so no extra loading indicator shows at the end.
  @override
  set value(PagingState<P, T> newValue) {
    super.value =
        !_hasMore.value &&
            newValue.hasNextPage &&
            (newValue.pages?.isNotEmpty ?? false)
        ? newValue.copyWith(hasNextPage: false)
        : newValue;
  }

  /// All loaded items, or null before the first page.
  List<T>? get items => value.items;

  @override
  void refresh() {
    _hasMore.value = true;
    super.refresh();
  }

  /// Loads the first page for the current page key and replaces the list
  /// with it. A page fetch that is still running is discarded.
  Future<void> reloadFirstPage({bool refresh = false}) async {
    final operation = this.operation = Object();
    final pageKey = _pageKeys().value.pageKey;
    try {
      final pageData = await _fetchPageData(pageKey, refresh: refresh);
      if (operation != this.operation) {
        return;
      }
      _hasMore.value = pageData.hasNext;
      value = PagingState<P, T>(
        pages: [pageData.data],
        keys: [pageKey],
        hasNextPage: pageData.hasNext,
      );
    } catch (error) {
      if (operation == this.operation) {
        value = value.copyWith(error: error, isLoading: false);
      }
    } finally {
      if (operation == this.operation) {
        this.operation = null;
      }
    }
  }
}

class _HasMore {
  bool value = true;
}
