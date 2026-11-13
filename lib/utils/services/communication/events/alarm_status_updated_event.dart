// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

/// An alarm was acknowledged or cleared: lists showing its status reload.
final class AlarmStatusUpdatedEvent extends CommunicationEvent {
  const AlarmStatusUpdatedEvent();
}
