// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/utils/services/page_data_paging_controller.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract base class PaginationRepository<T, B> {
  PaginationRepository({required this.pageKeyController}) {
    init();
  }

  late final PageDataPagingController<T, B> pagingController;
  final PageKeyController<T> pageKeyController;

  void init() {
    pagingController = PageDataPagingController(
      pageKeyController: pageKeyController,
      fetchPageData: (pageKey, {required refresh}) => fetchPageData(pageKey),
    );
    pageKeyController.addListener(_didChangePageKeyValue);
  }

  void dispose() {
    pageKeyController.removeListener(_didChangePageKeyValue);
    pagingController.dispose();
  }

  /// Reloads the first page in place.
  Future<void> refresh() => pagingController.reloadFirstPage(refresh: true);

  Future<PageData<B>> fetchPageData(T pageKey);

  void _didChangePageKeyValue() => pagingController.reloadFirstPage();
}
