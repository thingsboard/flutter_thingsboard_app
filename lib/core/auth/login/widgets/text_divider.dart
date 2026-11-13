// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).dividerTheme.color;
    return Row(
      spacing: 12,
      children: [
        Flexible(child: Divider(color: color)),
        Text(text, style: TbTextStyles.bodyMedium),
        Flexible(child: Divider(color: color)),
      ],
    );
  }
}
