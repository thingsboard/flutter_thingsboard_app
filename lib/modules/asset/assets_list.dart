// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/asset/assets_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssetsList extends BaseEntitiesWidget<Asset, PageLink>
    with AssetsBase, EntitiesListStateBase {
  AssetsList(super.pageKeyController, {super.key, super.searchMode});
}
