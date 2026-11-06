// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class AlarmStatusButton extends StatelessWidget {
  const AlarmStatusButton({required this.text, required this.onTap, super.key});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TbTextStyles.titleXs,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
