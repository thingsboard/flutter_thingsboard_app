// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

class WlPreloadWidget extends HookConsumerWidget {
  const WlPreloadWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wlLoading = useFuture(
      useMemoized(() => ref.read(wlProvider.notifier).updateWhiteLabeling()),
    );
    return wlLoading.connectionState == ConnectionState.waiting
        ? const ColoredBox(
            color: AppColors.scaffoldBackground,
            child: Padding(
              padding: EdgeInsets.all(48.0),
              child: Center(
                child: LinearProgressIndicator(
                  color: Colors.blueAccent,
                  backgroundColor: Colors.black12,
                ),
              ),
            ),
          )
        : child;
  }
}
