// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_logged_in_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/user/i_user_service.dart';

class UserService implements IUserService {
  UserService() {
    getIt<ICommunicationService>().on<UserLoggedInEvent>().listen((user) {});
  }
}
