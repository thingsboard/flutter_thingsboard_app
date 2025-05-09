import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DashboardPermissionErrorView extends TbPageWidget {
  DashboardPermissionErrorView(
    super.tbContext, {
    this.fullScreen = false,
    this.home = false,
    super.key,
  });

  final bool fullScreen;
  final bool home;

  @override
  State<StatefulWidget> createState() => _DashboardPermissionErrorViewState();
}

class _DashboardPermissionErrorViewState
    extends TbPageState<DashboardPermissionErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        leading: !widget.fullScreen && !widget.home
            ? BackButton(onPressed: () => Navigator.of(context).pop())
            : null,
        showLoadingIndicator: false,
        elevation: 1,
        shadowColor: Colors.transparent,
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.centerLeft,
          child: Text('Dashboard'),
        ),
        actions: widget.fullScreen && !widget.home
            ? [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => navigateTo('/profile?fullscreen=true'),
                ),
              ]
            : null,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ThingsboardImage.dashboardPermissionError,
              width: 101,
              height: 82,
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'It looks like your permissions aren\'t '
                'sufficient to complete this operation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25,
                ),
              ),
            ),
            const SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
