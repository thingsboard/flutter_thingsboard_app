// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/device/presentation/widgets/device_profiles_grid.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  final PageLinkController _pageLinkController = PageLinkController(
    pageSize: 10,
  );

  @override
  Widget build(BuildContext context) {
    final deviceProfilesList = DeviceProfilesGrid(_pageLinkController);
    return Scaffold(
      appBar: TbAppBar(title: Text(deviceProfilesList.title(context))),
      body: deviceProfilesList,
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
