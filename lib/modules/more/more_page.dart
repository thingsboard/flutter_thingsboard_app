import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/endpoint_name_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/modules/more/more_menu_item_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class MorePage extends TbContextWidget {
  MorePage(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage>
    with WidgetsBindingObserver {
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
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInfoAvatarWidget(
                    shortName: userDetails.shortName,
                    color: UiUtils.colorFromString(userDetails.displayName),
                  ),
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black.withOpacity(.54),
                        size: 18,
                      ),
                      onPressed: () async {
                        await navigateTo('/profile');
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      userDetails.displayName,
                      style: TbTextStyles.labelLarge.copyWith(
                        color: Colors.black.withOpacity(.76),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: EndpointNameWidget(
                      endpoint: getIt<IEndpointService>().getCachedEndpoint(),
                    ),
                  ),
                ],
              ),
              Text(
                _getAuthorityName(context),
                style: TbTextStyles.labelSmall.copyWith(
                  color: Colors.black.withOpacity(.38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: Colors.black.withOpacity(.05),
                  thickness: 1,
                  height: 0,
                ),
              ),
              buildMoreMenuItems(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: Colors.black.withOpacity(.05),
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
              const Spacer(),
              if (tbContext.wlService.showNameVersion == true)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      tbContext.wlService.platformNameAndVersion,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (getIt<IFirebaseService>().apps.isNotEmpty) {
        NotificationService().updateNotificationsCount();
      }
    }
  }

  Widget buildMoreMenuItems(BuildContext context) {
    final items = getIt<ILayoutService>().getMorePageItems(
      tbContext,
      context,
    ); //MoreMenuItem.getItems(tbContext, context);

    return ListView.separated(
      itemBuilder: (_, index) => MoreMenuItemWidget(
        items[index],
        onTap: () {
          if (!items[index].disabled) {
            navigateTo(items[index].path);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  items[index].disabledReasonMessage ?? 'The item is disabled',
                ),
              ),
            );
          }
        },
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  String _getAuthorityName(BuildContext context) {
    var user = tbContext.userDetails;
    var name = '';
    if (user != null) {
      var authority = user.authority;
      switch (authority) {
        case Authority.SYS_ADMIN:
          name = S.of(context).systemAdministrator;
          break;
        case Authority.TENANT_ADMIN:
          name = S.of(context).tenantAdministrator;
          break;
        case Authority.CUSTOMER_USER:
          name = S.of(context).customer;
          break;
        default:
          break;
      }
    }
    return name;
  }
}
