import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/endpoint_name_widget.dart';
import 'package:thingsboard_app/core/bloc/core_bloc.dart'
    show CoreBloc, CoreEventLogout;
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/modules/more/more_menu_item_widget.dart';
import 'package:thingsboard_app/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/services/mobile/i_mobile_service.dart';
import 'package:thingsboard_app/services/notification_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class MorePage extends TbContextWidget {
  MorePage(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage> {
  late final ({
    String? firstName,
    String? lastName,
    String? email
  }) userPersonalInfo;

  // I know it's bad
  late final IUserService userService;

  @override
  Widget build(BuildContext context) {
    final userDetails = getIt<UserDetailsUseCase>()(
      UserDetailsParams(
        firstName: userPersonalInfo.firstName ?? '',
        lastName: userPersonalInfo.lastName ?? '',
        email: userPersonalInfo.email ?? '',
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
              Flexible(
                child: buildMoreMenuItems(context),
              ),
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
                  context.read<CoreBloc>().add(const CoreEventLogout());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMoreMenuItems(BuildContext context) {
    final items = getIt<IMobileService>().getMorePageItems(tbContext, context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      child: ListView.separated(
        itemBuilder: (_, index) => MoreMenuItemWidget(
          items[index],
          onTap: () {
            navigateTo(items[index].path);
          },
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: items.length,
        shrinkWrap: true,
      ),
    );
  }

  String _getAuthorityName(BuildContext context) {
    switch (userService.getAuthority()) {
      case Authority.SYS_ADMIN:
        return S.of(context).systemAdministrator;

      case Authority.TENANT_ADMIN:
        return S.of(context).tenantAdministrator;

      case Authority.CUSTOMER_USER:
        return S.of(context).customer;
      default:
        return '';
    }
  }

  @override
  void initState() {
    userService = getIt();
    userPersonalInfo = userService.getUserDetails();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationService(tbClient, widget.log, tbContext)
          .updateNotificationsCount();
    });

    super.initState();
  }
}
