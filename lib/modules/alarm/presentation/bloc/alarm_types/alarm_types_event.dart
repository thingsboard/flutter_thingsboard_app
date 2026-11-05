// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

sealed class AlarmTypesEvent extends Equatable {
  const AlarmTypesEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmTypesSelectedEvent extends AlarmTypesEvent {
  const AlarmTypesSelectedEvent({required this.type});

  final String type;

  @override
  List<Object?> get props => [type];
}

final class AlarmTypesRemoveSelectedEvent extends AlarmTypesEvent {
  const AlarmTypesRemoveSelectedEvent({required this.type});

  final String type;

  @override
  List<Object?> get props => [type];
}

final class AlarmTypesResetEvent extends AlarmTypesEvent {
  const AlarmTypesResetEvent();
}

final class AlarmTypesRefreshEvent extends AlarmTypesEvent {
  const AlarmTypesRefreshEvent();
}

final class AlarmTypesResetUnCommittedChanges extends AlarmTypesEvent {
  const AlarmTypesResetUnCommittedChanges();
}
