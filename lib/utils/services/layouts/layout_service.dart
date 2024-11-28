import 'package:flutter/cupertino.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/thingsboard_client.dart' show PageLayout, Pages;
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';

class LayoutService implements ILayoutService {
  LayoutService(this.logger);

  final TbLogger logger;

  late Size deviceScreenSize;
  late List<TbMainNavigationItem> bottomBarItems;
  late TbMainNavigationItem more;
  late List<PageLayout> pagesLayout;

  @override
  List<TbMainNavigationItem> getBottomBarItems() {
    logger.debug('LayoutService::getBottomBarItems()');

    if (deviceScreenSize.width < 600) {
      return bottomBarItems.length > 4
          ? [...bottomBarItems.sublist(0, 3), more]
          : [...bottomBarItems, more];
    } else if (deviceScreenSize.width < 960) {
      return bottomBarItems.length > 7
          ? [...bottomBarItems.sublist(0, 6), more]
          : [...bottomBarItems, more];
    } else {
      return bottomBarItems.length > 9
          ? [...bottomBarItems.sublist(0, 8), more]
          : [...bottomBarItems, more];
    }
  }

  @override
  void setBottomBarItems(
    List<TbMainNavigationItem> items, {
    required TbMainNavigationItem more,
  }) {
    bottomBarItems = List.of(items);
    this.more = more;
  }

  @override
  void setDeviceScreenSize(Size size, {required Orientation orientation}) {
    logger.debug(
      'LayoutService::setDeviceScreenSize($size, orientation: $orientation)',
    );

    deviceScreenSize = size;
  }

  @override
  List<TbMainNavigationItem> getMorePageItems(
    TbContext tbContext,
    BuildContext context,
  ) {
    logger.debug('LayoutService::getMorePageItems()');

    final allItems = Set.of(bottomBarItems);
    final bottomBarElements = Set.of(getBottomBarItems());
    return allItems.difference(bottomBarElements).toList();
  }

  @override
  void cachePageLayouts(List<PageLayout>? pages) {
    logger.debug('LayoutService::cachePagesLayout()');
    if (pages == null || pages.isEmpty) {
      pagesLayout = [
        const PageLayout(id: Pages.home),
        const PageLayout(id: Pages.alarms),
        const PageLayout(id: Pages.devices),
        const PageLayout(id: Pages.customers),
        const PageLayout(id: Pages.assets),
        const PageLayout(id: Pages.audit_logs),
        const PageLayout(id: Pages.notifications),
      ];
    } else {
      pagesLayout = List.of(pages);
    }
  }

  @override
  List<PageLayout> getCachedPageLayouts() {
    return pagesLayout;
  }
}
