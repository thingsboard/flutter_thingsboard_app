// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';

import 'package:thingsboard_app/modules/tenant/presentation/widgets/tenants_list.dart';

class TenantsWidget extends StatefulWidget {
  const TenantsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TenantsWidgetState();
}

class _TenantsWidgetState extends State<TenantsWidget> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: TenantsList(_pageLinkController));
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
