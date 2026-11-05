// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({super.key, required this.logo, required this.onTap, this.title});
  final Widget logo;
  final VoidCallback onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
   style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
      onPressed: onTap,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          logo,
          if(title != null) 
          Text(title!, style: TbTextStyles.bodyLarge.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, height: 1), )
        ],
      ),
    );
  }
}
