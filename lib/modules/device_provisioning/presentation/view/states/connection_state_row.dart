// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class ConnectionStateRow extends StatelessWidget {
  const ConnectionStateRow(
    this.text, {
    required this.inProgress,
    this.error = false,
    super.key,
  });

  final bool inProgress;
  final String text;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          if (inProgress)
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 4),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          if (!inProgress)
            Icon(
              error ? Icons.cancel_outlined : Icons.check_circle_outline,
              color: error ? const Color(0xffD12730) : const Color(0xff00695C),
            ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(
                text,
                style: TbTextStyles.bodyLarge.copyWith(
                  color: Colors.black.withValues(alpha: .76),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
