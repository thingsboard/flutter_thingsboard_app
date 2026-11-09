// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedVisibilityWidget extends HookWidget {
  const AnimatedVisibilityWidget({
    super.key,
    required this.show,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.replacment = const SizedBox.shrink(),
    this.scale = false,
  });
  final bool show;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Widget replacment;

  /// Grows the child from 60% while it fades in; not for full-screen
  /// overlays, which would show as a growing box.
  final bool scale;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: duration,
      initialValue: show ? 1.0 : 0.0,
    );

    final animation = useAnimation(
      CurvedAnimation(parent: controller, curve: curve),
    );

    final isVisible = useState(show);

    useEffect(() {
      if (show) {
        isVisible.value = true;
        controller.forward();
      } else {
        controller.reverse().then((_) {
          isVisible.value = false;
        });
      }
      return null;
    }, [show]);

    if (!isVisible.value) {
      return replacment;
    }

    return Opacity(
      opacity: animation,
      child: scale
          ? Transform.scale(scale: 0.6 + (animation * 0.4), child: child)
          : child,
    );
  }
}
