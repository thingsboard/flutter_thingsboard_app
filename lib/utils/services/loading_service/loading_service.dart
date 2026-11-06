// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';

class LoadingService implements ILoadingService {
  final _isLoading = ValueNotifier(false);
  @override
  ValueNotifier<bool> get isLoading => _isLoading;
}
