import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';

import 'tenants_list.dart';

class TenantsWidget extends TbContextWidget<TenantsWidget, _TenantsWidgetState> {

  TenantsWidget(TbContext tbContext) : super(tbContext);

  @override
  _TenantsWidgetState createState() => _TenantsWidgetState();

}

class _TenantsWidgetState extends TbContextState<TenantsWidget, _TenantsWidgetState> {

  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
   return TenantsList(tbContext, _pageLinkController);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }

}
