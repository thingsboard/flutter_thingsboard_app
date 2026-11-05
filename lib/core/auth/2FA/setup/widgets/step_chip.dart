// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class StepChip extends StatelessWidget {
  const StepChip({
    super.key,
    required this.leading,
    required this.title,
    required this.content,
  });

  final String leading;
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(leading, style: TbTextStyles.titleSmallSb)],
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TbTextStyles.bodyMedium),
              content,
            ],
          ),
        ),
      ],
    );
  }
}
