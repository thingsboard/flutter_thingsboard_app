// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({
    super.key,
    required this.logo,
    required this.onTap,
    this.title,
  });
  final Widget logo;
  final VoidCallback onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    final title = this.title;
    // A button with only a logo shares its row equally with the others. With
    // many of them it gets narrower than a padded logo, so it has no side
    // padding to overflow. On a very narrow screen it scales the logo down too.
    if (title == null) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onTap,
        child: FittedBox(fit: BoxFit.scaleDown, child: logo),
      );
    }
    return OutlinedButton(
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
      onPressed: onTap,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          logo,
          Text(
            title,
            style: TbTextStyles.bodyLarge.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
