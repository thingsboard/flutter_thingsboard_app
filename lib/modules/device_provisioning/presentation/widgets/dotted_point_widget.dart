// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class DottedPointWidget extends StatelessWidget {
  const DottedPointWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withValues(alpha: .54)),
          ),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            text,
            style: TbTextStyles.bodyMedium.copyWith(
              color: Colors.black.withValues(alpha: .54),
            ),
          ),
        ),
      ],
    );
  }
}
