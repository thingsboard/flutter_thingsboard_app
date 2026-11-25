// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssigneeEntity extends Equatable {
  const AssigneeEntity({
    required this.userInfo,
    required this.shortName,
    required this.displayName,
  });

  factory AssigneeEntity.fromUserInfo(
    UserInfo info, {
    required UserDetailsUseCase detailsUseCase,
  }) {
    final details = detailsUseCase(
      UserDetailsParams(
        firstName: info.firstName,
        lastName: info.lastName,
        email: info.email,
      ),
    );

    return AssigneeEntity(
      userInfo: info,
      displayName: details.displayName,
      shortName: details.shortName,
    );
  }

  final UserInfo userInfo;
  final String shortName;
  final String displayName;

  @override
  List<Object?> get props => [userInfo, shortName, displayName];
}
