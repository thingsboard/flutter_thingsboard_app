import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/utils/utils.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only( left: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            ThingsboardImage.thingsBoardWithTitle,
            height: 30,
            colorFilter: Utils.toColorFilter(theme.primaryColor),
          ),
        ],
      ),
    );
  }
}
