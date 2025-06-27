import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';

import 'package:thingsboard_app/modules/tenant/tenants_list.dart';

class TenantsWidget extends TbContextWidget {
  TenantsWidget(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _TenantsWidgetState();
}

class _TenantsWidgetState extends TbContextState<TenantsWidget> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TenantsList(tbContext, _pageLinkController),
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
