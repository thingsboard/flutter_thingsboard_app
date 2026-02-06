import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/routes/router.dart';

import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DashboardsAppbar extends StatelessWidget {
  const DashboardsAppbar({
    required this.body,
    this.dashboardState = false,
    super.key,
    this.leading,
  });

  final Widget? leading;
  final Widget body;
  final bool dashboardState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
      //  canGoBack: leading != null,
        leading:
            leading,
        elevation: dashboardState ? 0 : 8,
        title: Center(
          child: SizedBox(
            height: 24,
            child: SvgPicture.asset(
              ThingsboardImage.thingsBoardWithTitle,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'ThingsBoard Logo',
            ),
          ),
        ),
        actions: [
          if (getIt<ITbClientService>().client.isSystemAdmin())
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                getIt<ThingsboardAppRouter>()
                // translate-me-ignore-next-line
                .navigateTo('/tenants?search=true');
              },
            ),
          if (leading != null) const SizedBox(width: 56),
        ],
      ),
      body: body,
    );
  }
}
