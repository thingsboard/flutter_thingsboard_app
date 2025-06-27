import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';

class DashboardGridCard extends TbContextWidget {

  DashboardGridCard(super.tbContext, {super.key, required this.dashboard});
  final DashboardInfo dashboard;

  @override
  State<StatefulWidget> createState() => _DashboardGridCardState();
}

class _DashboardGridCardState extends TbContextState<DashboardGridCard> {
  _DashboardGridCardState() : super();

  @override
  void didUpdateWidget(DashboardGridCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = widget.dashboard.image != null;
    Widget image;
    if (hasImage) {
      image =
          Utils.imageFromTbImage(context, tbClient, widget.dashboard.image);
    } else {
      image = SvgPicture.asset(
        ThingsboardImage.dashboardPlaceholder,
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.overlay,
        ),
        semanticsLabel: 'Dashboard',
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox.expand(
                  child: FittedBox(
                    clipBehavior: Clip.hardEdge,
                    fit: BoxFit.cover,
                    child: image,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          SizedBox(
            height: 44,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Center(
                child: AutoSizeText(
                  widget.dashboard.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
