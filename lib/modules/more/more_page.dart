import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MorePage extends TbContextWidget {
  MorePage(TbContext tbContext) : super(tbContext);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle,
                      size: 48, color: Color(0xFFAFAFAF)),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.settings, color: Color(0xFFAFAFAF)),
                      onPressed: () async {
                        await navigateTo('/profile');
                        setState(() {});
                      })
                ],
              ),
              SizedBox(height: 22),
              Text(_getUserDisplayName(),
                  style: TextStyle(
                      color: Color(0xFF282828),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 23 / 20)),
              SizedBox(height: 2),
              Text(_getAuthorityName(context),
                  style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 16 / 14)),
              SizedBox(height: 24),
              Divider(color: Color(0xFFEDEDED)),
              SizedBox(height: 8),
              buildMoreMenuItems(context),
              SizedBox(height: 8),
              Divider(color: Color(0xFFEDEDED)),
              SizedBox(height: 8),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                      height: 48,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            Icon(Icons.logout, color: Color(0xFFE04B2F)),
                            SizedBox(width: 34),
                            Text('${S.of(context).logout}',
                                style: TextStyle(
                                    color: Color(0xFFE04B2F),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 20 / 14))
                          ]))),
                  onTap: () {
                    tbClient.logout(
                        requestConfig: RequestConfig(ignoreErrors: true));
                  })
            ],
          ),
        ));
  }

  Widget buildMoreMenuItems(BuildContext context) {
    List<Widget> items =
        MoreMenuItem.getItems(tbContext, context).map((menuItem) {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
              height: 48,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Icon(menuItem.icon, color: Color(0xFF282828)),
                    SizedBox(width: 34),
                    Text(menuItem.title,
                        style: TextStyle(
                            color: Color(0xFF282828),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 20 / 14))
                  ]))),
          onTap: () {
            navigateTo(menuItem.path);
          });
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
          name = '${S.of(context).systemAdministrator}';
          break;
        case Authority.TENANT_ADMIN:
          name = '${S.of(context).tenantAdministrator}';
          break;
        case Authority.CUSTOMER_USER:
          name = '${S.of(context).customer}';
          break;
        default:
          break;
      }
    }
    return name;
  }
}

class MoreMenuItem {
  final String title;
  final IconData icon;
  final String path;

  MoreMenuItem({required this.title, required this.icon, required this.path});

  static List<MoreMenuItem> getItems(
      TbContext tbContext, BuildContext context) {
    if (tbContext.isAuthenticated) {
      List<MoreMenuItem> items = [];
      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          break;
        case Authority.TENANT_ADMIN:
          items.addAll([
            MoreMenuItem(
                title: '${S.of(context).customers}',
                icon: Icons.supervisor_account,
                path: '/customers'),
            MoreMenuItem(
                title: '${S.of(context).assets}',
                icon: Icons.domain,
                path: '/assets'),
            MoreMenuItem(
                title: '${S.of(context).auditLogs}',
                icon: Icons.track_changes,
                path: '/auditLogs')
          ]);
          break;
        case Authority.CUSTOMER_USER:
          items.addAll([
            MoreMenuItem(
                title: '${S.of(context).assets}',
                icon: Icons.domain,
                path: '/assets')
          ]);
          break;
        case Authority.REFRESH_TOKEN:
          break;
        case Authority.ANONYMOUS:
          break;
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }
      return items;
    } else {
      return [];
    }
  }
}
