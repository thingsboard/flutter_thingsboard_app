// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
class TbProgressIndicator extends ConsumerStatefulWidget {
  const TbProgressIndicator({this.size = 36.0, this.valueColor});
  final double size;
  final Color? valueColor;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TbProgressIndicatorState();
}

class _TbProgressIndicatorState extends ConsumerState<TbProgressIndicator>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  late CurvedAnimation? _rotation;

  @override
  void initState() {
    super.initState();
      _controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve,
      );
      _rotation = CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      );
      _controller!.repeat();
    
  }

  @override
  void didUpdateWidget(TbProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (ref.read(wlProvider).isCustomLogo) {
      if (_controller != null) {
        _controller!.dispose();
        _controller = null;
      }
    } else {
      if (_controller == null) {
        _controller = AnimationController(
          duration: const Duration(milliseconds: 1500),
          vsync: this,
          animationBehavior: AnimationBehavior.preserve,
        );
        _rotation = CurvedAnimation(
          parent: _controller!,
          curve: Curves.easeInOut,
        );
        _controller!.repeat();
      } else if (!_controller!.isAnimating) {
        _controller!.repeat();
      }
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wlState = ref.watch(wlProvider);
    final theme = Theme.of(context);
    if (wlState.isCustomLogo && wlState.isUserWlMode) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
        child: CircularProgressIndicator(
          color: widget.valueColor ?? theme.colorScheme.secondary,
        ),
      );
    } else {
      return Stack(
        children: [
          SvgPicture.asset(
            ThingsboardImage.thingsboardCenter,
            height: widget.size,
            width: widget.size,
            colorFilter: ColorFilter.mode(
               theme.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
          AnimatedBuilder(
            animation: _rotation!,
            child: SvgPicture.asset(
              ThingsboardImage.thingsboardOuter,
              height: widget.size,
              width: widget.size,
              colorFilter: ColorFilter.mode(
                widget.valueColor ?? theme.colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _rotation!.value * pi * 2,
                child: child,
              );
            },
          ),
        ],
      );
    }
  }
}
