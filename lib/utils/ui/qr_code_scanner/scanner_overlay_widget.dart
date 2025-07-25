import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/scan_area_clipper.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/utils.dart';

class ScannerOverlayWidget extends StatelessWidget {
  const ScannerOverlayWidget({
    super.key,
    required this.cameraSize,
  });

  final Size cameraSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: ClipPath(
            clipper: ScanAreaClipper(
                areaSize: Size(cameraSize.width - 10, cameraSize.height - 10)),
            child: ColoredBox(
              color: AppColors.textPrimary.withAlpha(80),
            ),
          ),
        ),
        Center(
          child: SizedBox(
              width: cameraSize.width,
              height: cameraSize.height,
              child: Stack(
                children: List<Widget>.generate(4, (index) {
                  final positions = [
                    {'left': 0.0, 'top': 0.0},
                    {'right': 0.0, 'top': 0.0},
                    {'right': 0.0, 'bottom': 0.0},
                    {'left': 0.0, 'bottom': 0.0},
                  ];

                  final pos = positions[index];

                  return Positioned(
                    left: pos['left'],
                    right: pos['right'],
                    top: pos['top'],
                    bottom: pos['bottom'],
                    child: Transform.rotate(
                      angle: Utils.degreesToRadians(index * 90),
                      child:
                          SvgPicture.asset('assets/images/scan_rectangle.svg'),
                    ),
                  );
                }),
              )),
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(top: cameraSize.height + textPadding),
          child: Text(
            S.of(context).pleaseScanQrCodeOnYourDevice,
            style:
                TbTextStyles.bodyLarge.copyWith(color: AppColors.textWhite),
          ),
        )),
      ],
    );
  }
}

const textPadding = 128;
