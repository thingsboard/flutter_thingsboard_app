import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/tenant/tenants_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_app_search_bar.dart';

class TenantsPage extends TbPageWidget {

  TenantsPage(super.tbContext, {this.searchMode = false, super.key});
  final bool searchMode;

  @override
  State<StatefulWidget> createState() => _TenantsPageState();
}

class _TenantsPageState extends TbPageState<TenantsPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    final tenantsList = TenantsList(
      tbContext,
      _pageLinkController,
      searchMode: widget.searchMode,
    );
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) => _pageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(
        tbContext,
        title: Text(tenantsList.title),
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
