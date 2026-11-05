// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class FetchAlarmCommentsUseCase
    extends UseCase<Future<PageData<AlarmCommentInfo>>, AlarmCommentsQuery> {
  const FetchAlarmCommentsUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<PageData<AlarmCommentInfo>> call(AlarmCommentsQuery params) {
    return repository.fetchAlarmComments(params);
  }
}
