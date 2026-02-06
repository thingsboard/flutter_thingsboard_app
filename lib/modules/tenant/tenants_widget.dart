import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';

import 'package:thingsboard_app/modules/tenant/tenants_list.dart';

class TenantsWidget extends StatefulWidget {
  const TenantsWidget( {super.key});

  @override
  State<StatefulWidget> createState() => _TenantsWidgetState();
}

class _TenantsWidgetState extends State<TenantsWidget> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TenantsList( _pageLinkController),
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
