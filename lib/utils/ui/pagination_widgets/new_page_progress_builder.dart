// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class NewPageProgressBuilder extends StatelessWidget {
  const NewPageProgressBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Center(child: RefreshProgressIndicator()),
    );
  }
}
