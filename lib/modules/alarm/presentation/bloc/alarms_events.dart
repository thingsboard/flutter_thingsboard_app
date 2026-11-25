// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';

sealed class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmFiltersResetEvent extends AlarmEvent {
  const AlarmFiltersResetEvent();
}

final class AlarmFiltersUpdateEvent extends AlarmEvent {
  const AlarmFiltersUpdateEvent({required this.filtersEntity});

  final AlarmFiltersEntity filtersEntity;

  @override
  List<Object?> get props => [filtersEntity];
}

final class AlarmSearchTextChanged extends AlarmEvent {
  const AlarmSearchTextChanged({required this.searchText});

  final String? searchText;

  @override
  List<Object?> get props => [searchText];
}

final class AlarmsRefreshPageEvent extends AlarmEvent {
  const AlarmsRefreshPageEvent();

  @override
  List<Object?> get props => [double.nan];
}
