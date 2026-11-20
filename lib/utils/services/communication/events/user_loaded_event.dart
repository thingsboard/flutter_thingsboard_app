// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

/// Event fired when a user is successfully loaded in the ThingsBoard client
final class UserLoadedEvent extends CommunicationEvent {
  const UserLoadedEvent();

  @override
  List<Object?> get props => [];
}
