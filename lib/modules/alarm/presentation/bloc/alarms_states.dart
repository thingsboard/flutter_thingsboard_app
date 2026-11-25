// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

sealed class AlarmsState extends Equatable {
  const AlarmsState();

  @override
  List<Object?> get props => [];
}

final class AlarmsFiltersNotActivatedState extends AlarmsState {
  const AlarmsFiltersNotActivatedState();
}

final class AlarmsFilterActivatedState extends AlarmsState {
  const AlarmsFilterActivatedState();
}
