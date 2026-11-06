// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class UserInfoAvatarWidget extends StatelessWidget {
  const UserInfoAvatarWidget({
    required this.shortName,
    required this.color,
    super.key,
  }) : assert(shortName.length <= 2, 'shortName is $shortName');

  final String shortName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      padding: const EdgeInsets.all(4),
      height: 32,
      width: 32,
      child: Center(
        child: Text(
          shortName,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            letterSpacing: 1,
            height: 1.14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
