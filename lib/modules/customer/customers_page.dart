import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/customer/customers_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class CustomersPage extends TbPageWidget {
  final bool searchMode;

  CustomersPage(TbContext tbContext, {this.searchMode = false})
      : super(tbContext);

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends TbPageState<CustomersPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    var customersList = CustomersList(tbContext, _pageLinkController,
        searchMode: widget.searchMode);
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) => _pageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(tbContext, title: Text(customersList.title), actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            navigateTo('/customers?search=true');
          },
        )
      ]);
    }
    return Scaffold(appBar: appBar, body: customersList);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
