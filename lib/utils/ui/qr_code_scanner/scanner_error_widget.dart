import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';

class ScannerErrorWidget extends HookWidget {
  const ScannerErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: SizedBox.expand(
          child: ColoredBox(
            color: AppColors.cameraBackground,
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset('assets/images/scaner.svg'),
                ),
              ],
            ),
          ),
        ));
  }
}
