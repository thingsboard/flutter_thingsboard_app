// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

sealed class AlarmTypesState extends Equatable {
  const AlarmTypesState();

  @override
  List<Object?> get props => [];
}

final class AlarmTypeSelectedState extends AlarmTypesState {
  const AlarmTypeSelectedState({
    required this.selectedTypes,
    required this.allowToAddMore,
  });

  final Set<String> selectedTypes;
  final bool allowToAddMore;

  @override
  List<Object?> get props => [double.nan];
}

final class AlarmTypesSelectionEmptyState extends AlarmTypesState {
  const AlarmTypesSelectionEmptyState();

  @override
  List<Object?> get props => [];
}
