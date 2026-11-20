// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/utils/services/page_data_paging_controller.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class _PageKeys extends PageKeyController<PageLink> {
  _PageKeys() : super(PageLink(2));

  @override
  PageLink nextPageKey(PageLink pageKey) => pageKey.nextPageLink();
}

void main() {
  late _PageKeys keys;
  late List<(int page, String? search, bool refresh)> requests;
  late Map<int, PageData<String>> pages;

  PageDataPagingController<PageLink, String> controller() =>
      PageDataPagingController(
        pageKeyController: keys,
        fetchPageData: (pageKey, {required refresh}) async {
          requests.add((pageKey.page, pageKey.textSearch, refresh));
          return pages[pageKey.page]!;
        },
      );

  Future<void> fetchNext(PagingController<PageLink, String> c) async {
    c.fetchNextPage();
    await pumpEventQueue();
  }

  setUp(() {
    keys = _PageKeys();
    requests = [];
    pages = {
      0: PageData(['a', 'b'], 2, 3, true),
      1: PageData(['c'], 2, 3, false),
    };
  });

  test('loads pages until one reports no next page', () async {
    final c = controller();

    await fetchNext(c);
    await fetchNext(c);
    await fetchNext(c);

    expect(c.items, ['a', 'b', 'c']);
    expect(c.hasNextPage, isFalse);
    expect(requests.map((r) => r.$1), [0, 1]);
  });

  test('the first page uses the current page key (search text)', () async {
    final c = controller();
    keys.value.pageKey.textSearch = 'boiler';

    await fetchNext(c);

    expect(requests.single, (0, 'boiler', false));
  });

  test('refresh starts over and allows loading again', () async {
    final c = controller();
    await fetchNext(c);
    await fetchNext(c);
    expect(c.hasNextPage, isFalse);

    c.refresh();
    await fetchNext(c);

    expect(c.items, ['a', 'b']);
    expect(c.hasNextPage, isTrue);
  });

  test('reloadFirstPage replaces the list with a fresh first page', () async {
    final c = controller();
    await fetchNext(c);
    await fetchNext(c);
    pages[0] = PageData(['x'], 1, 1, false);

    await c.reloadFirstPage(refresh: true);

    expect(c.items, ['x']);
    expect(c.hasNextPage, isFalse);
    expect(requests.last, (0, null, true));
  });

  test('reloadFirstPage reports a failed load as the list error', () async {
    final c = PageDataPagingController<PageLink, String>(
      pageKeyController: keys,
      fetchPageData: (_, {required refresh}) async =>
          throw ThingsboardError(message: 'down'),
    );

    await c.reloadFirstPage();

    expect(c.error, isA<ThingsboardError>());
    expect(c.isLoading, isFalse);
  });

  test(
    'a page that arrives after reloadFirstPage started is dropped',
    () async {
      final slow = Completer<PageData<String>>();
      var calls = 0;
      final c = PageDataPagingController<PageLink, String>(
        pageKeyController: keys,
        fetchPageData: (_, {required refresh}) => calls++ == 0
            ? slow.future
            : Future.value(PageData(['new'], 1, 1, false)),
      );

      c.fetchNextPage();
      await c.reloadFirstPage();
      slow.complete(PageData(['old'], 1, 1, false));
      await pumpEventQueue();

      expect(c.items, ['new']);
    },
  );
}
