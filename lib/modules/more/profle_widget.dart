import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/endpoint_name_widget.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.userDetails, this.user});
  final UserDetailsOutput userDetails;
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
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
              height: 40,
              width: 40,
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: AppColors.iconTertiary,
                  size: 24,
                ),
                onPressed: () {
                  context.push('/profile');
                },
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userDetails.displayName,
                    style: TbTextStyles.labelLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    getAuthorityName(context, user),
                    style: TbTextStyles.labelSmall.copyWith(
                      color: AppColors.textDisabled,
                    ),
                  ),
                ],
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
      ],
    );
  }
}

String getAuthorityName(BuildContext context, User? user) {
  var name = '';
  if (user != null) {
    final authority = user.authority;
    switch (authority) {
      case Authority.SYS_ADMIN:
        name = S.of(context).systemAdministrator;
      case Authority.TENANT_ADMIN:
        name = S.of(context).tenantAdministrator;
      case Authority.CUSTOMER_USER:
        name = S.of(context).customer;
      default:
        break;
    }
  }
  return name;
}
