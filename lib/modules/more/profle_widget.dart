import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/endpoint_name_widget.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.userDetails, this.user});
  final UserDetailsOutput userDetails;
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              height: 32,
              width: 32,
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black.withValues(alpha: .54),
                  size: 18,
                ),
                onPressed: () async {
                  await getIt<ThingsboardAppRouter>().navigateTo('/profile');
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
                  color: Colors.black.withValues(alpha: .76),
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
          _getAuthorityName(context, user),
          style: TbTextStyles.labelSmall.copyWith(
            color: Colors.black.withValues(alpha: .38),
          ),
        ),
      ],
    );
  }

  String _getAuthorityName(BuildContext context, User? user) {
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
}
