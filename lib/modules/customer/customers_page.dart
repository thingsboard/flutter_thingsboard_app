// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/customer/customers_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_app_search_bar.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({this.searchMode = false, super.key});
  final bool searchMode;

  @override
  State<StatefulWidget> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    final customersList = CustomersList(
      _pageLinkController,
      searchMode: widget.searchMode,
    );
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        onSearch: (searchText) => _pageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(
        title: Text(customersList.title(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // translate-me-ignore-next-line
              getIt<ThingsboardAppRouter>().navigateTo(
                '/customers?search=true',
              );
            },
          ),
        ],
      );
    }
    return Scaffold(appBar: appBar, body: customersList);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
