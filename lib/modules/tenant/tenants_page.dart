// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/tenant/tenants_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_app_search_bar.dart';

class TenantsPage extends StatefulWidget {
  const TenantsPage({this.searchMode = false, super.key});
  final bool searchMode;

  @override
  State<StatefulWidget> createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantsPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    final tenantsList = TenantsList(
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
        title: Text(tenantsList.title(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // translate-me-ignore-next-line
              getIt<ThingsboardAppRouter>().navigateTo('/tenants?search=true');
            },
          ),
        ],
      );
    }
    return Scaffold(appBar: appBar, body: tenantsList);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
