// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart';

sealed class VersionInfoEvent extends Equatable {
  const VersionInfoEvent();

  @override
  List<Object?> get props => [];
}

final class VersionInfoFetchEvent extends VersionInfoEvent {
  const VersionInfoFetchEvent(this.args);

  final VersionRouteArguments args;

  @override
  List<Object?> get props => [args];
}
