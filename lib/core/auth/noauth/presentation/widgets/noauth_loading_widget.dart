// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class NoAuthLoadingWidget extends StatelessWidget {
  const NoAuthLoadingWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return  const SizedBox.expand(
      child: ColoredBox(
        color: Color(0x99FFFFFF),
        child: Center(
          child: TbProgressIndicator(size: 50.0),
        ),
      ),
    );
  }
}
