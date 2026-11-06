// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/thingsboard_client_extensions.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:timeago/timeago.dart' as timeago;

class SystemActivityWidget extends StatelessWidget {
  const SystemActivityWidget(this.activity, {super.key});

  final AlarmCommentInfo activity;

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(activity.createdTime ?? 0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          timeago.format(DateTime.now().subtract(diff)),
          style: TbTextStyles.labelMedium.copyWith(
            color: Colors.black.withValues(alpha: .38),
          ),
        ),
        Text(
          activity.commentText ?? '',
          style: TbTextStyles.bodyLarge.copyWith(
            color: Colors.black.withValues(alpha: .54),
          ),
        ),
      ],
    );
  }
}
