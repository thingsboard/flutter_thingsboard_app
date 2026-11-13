// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class FilterDataEntity<T> extends Equatable {
  const FilterDataEntity({required this.getLocalizedLabel, required this.data});

  final T data;
  final String Function(BuildContext context) getLocalizedLabel;
  @override
  List<Object?> get props => [data];
}
