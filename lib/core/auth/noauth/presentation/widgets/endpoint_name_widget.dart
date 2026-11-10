// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class EndpointNameWidget extends StatelessWidget {
  const EndpointNameWidget({required this.endpoint, super.key});

  final String endpoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColor.withValues(alpha: .06),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Text(
        Uri.parse(endpoint).host,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TbTextStyles.bodySmall.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
