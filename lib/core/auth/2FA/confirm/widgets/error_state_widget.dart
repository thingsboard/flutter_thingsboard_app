import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/utils/utils.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            ThingsboardImage.twoFaSetup,
            width: 140,
            height: 140,
            colorFilter: Utils.toColorFilter(AppColors.textError),
          ),
          Text(title, style: TbTextStyles.titleSmallSb),
          Text(description, style: TbTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
