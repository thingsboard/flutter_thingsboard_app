// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/modules/main/model/navigation_item_data.dart';

part 'navigation_state.freezed.dart';

@freezed
abstract class NavigationState with _$NavigationState {

const   factory NavigationState({
  required List<NavigationItemData> bottomBarPages,
  required List<NavigationItemData> morePages,
}) = _NavigationState;
}