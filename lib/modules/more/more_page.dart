import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/endpoint_name_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';

class MorePage extends TbContextWidget {
  MorePage(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 48,
                        color: Color(0xFFAFAFAF),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Color(0xFFAFAFAF),
                        ),
                        onPressed: () async {
                          await navigateTo('/profile');
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          _getUserDisplayName(),
                          style: const TextStyle(
                            color: Color(0xFF282828),
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            height: 23 / 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: EndpointNameWidget(
                          endpoint:
                              getIt<IEndpointService>().getCachedEndpoint(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _getAuthorityName(context),
                    style: const TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 16 / 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFFEDEDED)),
                  const SizedBox(height: 8),
                  buildMoreMenuItems(context),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xFFEDEDED)),
                  const SizedBox(height: 8),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      height: 48,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 18,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Color(0xFFE04B2F),
                            ),
                            const SizedBox(width: 34),
                            Text(
                              S.of(context).logout,
                              style: const TextStyle(
                                color: Color(0xFFE04B2F),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
    final items = getIt<ILayoutService>()
        .getMorePageItems(tbContext, context)
        .map((menuItem) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(menuItem.icon, color: const Color(0xFF282828)),
                const SizedBox(width: 34),
                Text(
                  menuItem.title,
                  style: const TextStyle(
                    color: Color(0xFF282828),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          navigateTo(menuItem.path);
        },
      );
    }).toList();

    return Column(children: items);
  }

  String _getUserDisplayName() {
    var user = tbContext.userDetails;
    var name = '';
    if (user != null) {
      if ((user.firstName != null && user.firstName!.isNotEmpty) ||
          (user.lastName != null && user.lastName!.isNotEmpty)) {
        if (user.firstName != null) {
          name += user.firstName!;
        }
        if (user.lastName != null) {
          if (name.isNotEmpty) {
            name += ' ';
          }
          name += user.lastName!;
        }
      } else {
        name = user.email;
      }
    }
    return name;
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
