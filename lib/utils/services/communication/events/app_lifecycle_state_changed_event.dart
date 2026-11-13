// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

final class AppLifecycleStateChangedEvent extends CommunicationEvent {
  const AppLifecycleStateChangedEvent(this.state);

  final AppLifecycleState state;

  @override
  List<Object?> get props => [state];
}
