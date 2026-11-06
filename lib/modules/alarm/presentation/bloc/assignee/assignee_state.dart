// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';

sealed class AssigneeState extends Equatable {
  const AssigneeState();

  @override
  List<Object?> get props => [];
}

final class AssigneeEmptyState extends AssigneeState {
  const AssigneeEmptyState();
}

final class AssigneeSelectedState extends AssigneeState {
  const AssigneeSelectedState({required this.assignee});

  final AssigneeEntity assignee;

  @override
  List<Object?> get props => [assignee];
}

final class AssigneeSelfAssignmentState extends AssigneeState {
  const AssigneeSelfAssignmentState();
}
