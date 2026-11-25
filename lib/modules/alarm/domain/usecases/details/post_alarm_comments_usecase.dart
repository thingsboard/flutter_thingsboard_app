// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class PostAlarmCommentsUseCase
    extends UseCase<Future<AlarmCommentInfo>, PostAlarmCommentParams> {
  const PostAlarmCommentsUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmCommentInfo> call(PostAlarmCommentParams params) {
    final comment = params.comment.trimLeft().trimRight();
    if (comment.isEmpty) {
      throw Exception('An empty comment was rejected to be posted.');
    }

    if (params.id != null) {
      return repository.updateComment(
        params.alarmId,
        id: params.id!,
        comment: comment,
      );
    }

    return repository.postComment(params.alarmId, comment: comment);
  }
}

final class PostAlarmCommentParams {
  const PostAlarmCommentParams({
    required this.alarmId,
    required this.comment,
    this.id,
  });

  final AlarmId alarmId;
  final String? id;
  final String comment;
}
