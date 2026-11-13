// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class RegionWidget extends StatelessWidget {
  const RegionWidget({
    required this.title,
    required this.subTitle,
    required this.selected,
    this.onTap,
    super.key,
  });

  final String title;
  final String subTitle;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: selected
            ? theme.primaryColor.withValues(alpha: .1)
            : Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TbTextStyles.labelLarge.copyWith(
                    color: selected
                        ? Theme.of(context).primaryColor
                        : Colors.black.withValues(alpha: .76),
                  ),
                ),
                Text(
                  subTitle,
                  style: TbTextStyles.bodyMedium.copyWith(
                    color: Colors.black.withValues(alpha: .38),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: selected,
              child: Icon(
                Icons.check_outlined,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
