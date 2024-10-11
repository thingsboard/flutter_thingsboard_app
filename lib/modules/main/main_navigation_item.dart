import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_page.dart';
import 'package:thingsboard_app/modules/device/devices_main_page.dart';
import 'package:thingsboard_app/modules/home/home_page.dart';
import 'package:thingsboard_app/modules/more/more_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TbMainNavigationItem {
  final Widget page;
  String title;
  final IconData icon;
  final String path;

  TbMainNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.path,
  });

  static const mainPageStateMap = <Authority, Set<String>>{
    Authority.SYS_ADMIN: {'/home', '/more'},
    Authority.TENANT_ADMIN: {'/home', '/alarms', '/devices', '/more'},
    Authority.CUSTOMER_USER: {'/home', '/alarms', '/devices', '/more'},
  };

  static bool isMainPageState(TbContext tbContext, String path) {
    if (tbContext.isAuthenticated) {
      return mainPageStateMap[tbContext.tbClient.getAuthUser()!.authority]!
          .contains(path);
    } else {
      return false;
    }
  }

  static List<TbMainNavigationItem> getItems(TbContext tbContext) {
    if (tbContext.isAuthenticated) {
      final items = [
        TbMainNavigationItem(
          page: HomePage(tbContext),
          title: 'Home',
          icon: Icons.home_outlined,
          path: '/home',
        ),
      ];

      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          break;
        case Authority.TENANT_ADMIN:
        case Authority.CUSTOMER_USER:
          items.addAll(
            [
              TbMainNavigationItem(
                page: AlarmsPage(tbContext),
                title: 'Alarms',
                icon: Icons.notifications_outlined,
                path: '/alarms',
              ),
              TbMainNavigationItem(
                page: DevicesMainPage(tbContext),
                title: 'Devices',
                icon: Icons.devices_outlined,
                path: '/devices',
              ),
            ],
          );
          break;
        case Authority.REFRESH_TOKEN:
          break;
        case Authority.ANONYMOUS:
          break;
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }

      items.add(
        TbMainNavigationItem(
          page: MorePage(tbContext),
          title: 'More',
          icon: Icons.menu_outlined,
          path: '/more',
        ),
      );
      return items;
    } else {
      return [];
    }
  }

  static void changeItemsTitleIntl(
    List<TbMainNavigationItem> items,
    BuildContext context,
  ) {
    for (final item in items) {
      switch (item.path) {
        case '/home':
          item.title = S.of(context).home;
          break;
        case '/alarms':
          item.title = S.of(context).alarms;
          break;
        case '/devices':
          item.title = S.of(context).devices;
          break;
        case '/more':
          item.title = S.of(context).more;
          break;
      }
    }
  }
}
