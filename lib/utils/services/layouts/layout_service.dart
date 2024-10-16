import 'package:flutter/cupertino.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/modules/more/more_menu_item.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';

class LayoutService implements ILayoutService {
  LayoutService(this.logger);

  final TbLogger logger;

  late Size deviceScreenSize;
  late final List<TbMainNavigationItem> bottomBarItems;
  late final TbMainNavigationItem more;

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
    final difference = allItems.difference(bottomBarElements).toList();

    return difference.isNotEmpty
        ? difference
        : MoreMenuItem.getItems(tbContext, context)
            .map(
              (e) => TbMainNavigationItem(
                page: const SizedBox.shrink(),
                title: e.title,
                icon: e.icon,
                path: e.path,
              ),
            )
            .toList();
  }
}
