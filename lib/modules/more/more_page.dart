import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/modules/more/more_menu_item_widget.dart';
import 'package:thingsboard_app/modules/more/profle_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';


class MorePage extends TbContextWidget {
  MorePage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage> {
  @override
  Widget build(BuildContext context) {
    final userDetails = getIt<UserDetailsUseCase>()(
      UserDetailsParams(
        firstName: tbContext.userDetails?.firstName ?? '',
        lastName: tbContext.userDetails?.lastName ?? '',
        email: tbContext.userDetails?.email ?? '',
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileWidget(
                      userDetails: userDetails,
                      user: tbContext.userDetails,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Divider(
                        color: Colors.black.withValues(alpha: .05),
                        thickness: 1,
                        height: 0,
                      ),
                    ),
                    Flexible(child: buildMoreMenuItems(context)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Divider(
                        color: Colors.black.withValues(alpha: .05),
                        thickness: 1,
                        height: 0,
                      ),
                    ),
                    MoreMenuItemWidget(
                      TbMainNavigationItem(
                        title: S.of(context).logout,
                        icon: Icons.logout,
                        page: const SizedBox.shrink(),
                        path: '',
                      ),
                      color: const Color(0xffD12730),
                      onTap: () {
                        tbContext.logout(
                          requestConfig: RequestConfig(ignoreErrors: true),
                        );
                      },
                    ),
                  ],
                ),
              ),
              versionInfo(),
              appVersionInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMoreMenuItems(BuildContext context) {
    final items = getIt<ILayoutService>().getMorePageItems(tbContext, context);
    final widgets =
        items
            .map(
              (e) => MoreMenuItemWidget(
                e,
                onTap: () {
                  getIt<ThingsboardAppRouter>().navigateTo(e.path);
                },
              ),
            )
            .toList();
    return SingleChildScrollView(
      child: Column(spacing: 16 ,children: widgets),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationService(
        tbClient,
        widget.log,
        tbContext,
      ).updateNotificationsCount();
    });

    super.initState();
  }

  Widget versionInfo() {
    return const SizedBox();
  }

  Widget appVersionInfo() {
    final ver = getIt<IDeviceInfoService>().getBuildVersion();
    if (EnvironmentVariables.showAppVersion) {
      // translate-me-ignore-next-line
      return Text('version: $ver');
    }
    return const SizedBox();
  }
}
