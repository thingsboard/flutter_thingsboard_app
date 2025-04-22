import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class TbErrorWidget extends StatelessWidget {
  const TbErrorWidget({
    this.onRefresh,
    this.title,
    this.message,
    super.key,
  });

  final VoidCallback? onRefresh;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 72),
        SvgPicture.asset(
          ThingsboardImage.noDataImage,
          width: 94,
          height: 76,
        ),
        const SizedBox(height: 12),
        Text(
          title ?? S.of(context).failedToLoadTheList,
          style: TbTextStyles.titleXs.copyWith(
            color: Colors.black.withOpacity(.87),
          ),
        ),
        Text(
          message ?? S.of(context).tryRefreshing,
          style: TbTextStyles.bodyLarge.copyWith(
            color: Colors.black.withOpacity(.54),
          ),
        ),
        const SizedBox(height: 32),
        Visibility(
          visible: onRefresh != null,
          child: TextButton(
            onPressed: onRefresh,
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
              fixedSize: const Size(216, 48),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.refresh_rounded),
                Text(S.of(context).refresh),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
