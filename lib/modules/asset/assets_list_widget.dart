// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/asset/assets_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssetsListWidget extends EntitiesListPageLinkWidget<Asset>
    with AssetsBase {
  AssetsListWidget({super.key, super.controller});

  @override
  void onViewAll() {
    getIt<ThingsboardAppRouter>().navigateTo('/assets');
  }
}
