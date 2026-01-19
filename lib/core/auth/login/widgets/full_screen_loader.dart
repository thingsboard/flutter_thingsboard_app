import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withValues(alpha: 0.2),
            ),
            child: Container(
              alignment: Alignment.center,
              child: const TbProgressIndicator(size: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}
