import 'package:flutter/material.dart';
import 'package:thingsboard_app/constants/app_colors.dart';

extension on Icon {
  Icon get whiteIcon {
    return Icon(this.icon, color: AppColors.backgroundColor,);
  }
}
