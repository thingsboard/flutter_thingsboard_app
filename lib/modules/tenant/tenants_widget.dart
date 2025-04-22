import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/legacy/i_legacy_service.dart';

import 'tenants_list.dart';

class TenantsWidget extends StatefulWidget {
  const TenantsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TenantsWidgetState();
}

class _TenantsWidgetState extends State<StatefulWidget> {
  final _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TenantsList(
        getIt<ILegacyService>().tbContext,
        _pageLinkController,
      ),
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
