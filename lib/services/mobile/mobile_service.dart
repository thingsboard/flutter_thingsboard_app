import 'package:flutter/cupertino.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/mobile/i_mobile_service.dart';
import 'package:thingsboard_app/services/system/i_system_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show
        Authority,
        LoginMobileInfo,
        MobileBasicInfo,
        MobileInfoQuery,
        PageLayout,
        Pages,
        PlatformType,
        RequestConfig,
        ThingsboardClient;

class MobileService implements IMobileService {
  MobileService({
    required this.tbClient,
    required this.logger,
    required this.systemService,
  });

  final ILoggerService logger;
  final ThingsboardClient tbClient;
  final ISystemService systemService;

  late Size deviceScreenSize;
  late List<TbMainNavigationItem> bottomBarItems;
  late TbMainNavigationItem more;
  late List<PageLayout> pagesLayout;

  @override
  List<TbMainNavigationItem> getBottomBarItems() {
    logger.debug(
      'LayoutService::getBottomBarItems() device width'
      ' -> ${deviceScreenSize.width}',
    );

    if (deviceScreenSize.width < 600) {
      return bottomBarItems.length > 3
          ? [...bottomBarItems.sublist(0, 3), more]
          : [...bottomBarItems, more];
    } else if (deviceScreenSize.width < 960) {
      return bottomBarItems.length > 5
          ? [...bottomBarItems.sublist(0, 5), more]
          : [...bottomBarItems, more];
    } else {
      return bottomBarItems.length > 9
          ? [...bottomBarItems.sublist(0, 9), more]
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
  void cachePageLayouts(
    List<PageLayout>? pages, {
    required Authority authority,
  }) {
    logger.debug('LayoutService::cachePagesLayout()');
    if (pages == null) {
      pagesLayout = [
        const PageLayout(id: Pages.home),
        const PageLayout(id: Pages.alarms),
        const PageLayout(id: Pages.devices),
      ];

      if (authority == Authority.SYS_ADMIN) {
        pagesLayout.add(const PageLayout(id: Pages.notifications));
      } else if (authority == Authority.TENANT_ADMIN) {
        pagesLayout.addAll(
          [
            const PageLayout(id: Pages.customers),
            const PageLayout(id: Pages.assets),
            const PageLayout(id: Pages.audit_logs),
            const PageLayout(id: Pages.notifications),
          ],
        );
      } else if (authority == Authority.CUSTOMER_USER) {
        pagesLayout.addAll(
          [
            const PageLayout(id: Pages.assets),
            const PageLayout(id: Pages.notifications),
          ],
        );
      }
    } else {
      pagesLayout = List.of(pages);
    }
  }

  @override
  List<PageLayout> getCachedPageLayouts() {
    return pagesLayout;
  }

  @override
  Future<LoginMobileInfo?> getLoginMobileInfo({RequestConfig? config}) async {
    final platform = systemService.getPlatform();
    final packageName = await systemService.getPackageName();

    return tbClient.getMobileService().getLoginMobileInfo(
          MobileInfoQuery(
            platformType:
                platform.isIos ? PlatformType.IOS : PlatformType.ANDROID,
            packageName: packageName,
          ),
          requestConfig: config,
        );
  }

  @override
  Future<MobileBasicInfo?> getUserMobileInfo({RequestConfig? config}) async {
    final platform = systemService.getPlatform();

    return tbClient.getMobileService().getUserMobileInfo(
          MobileInfoQuery(
            platformType:
                platform.isIos ? PlatformType.IOS : PlatformType.ANDROID,
            packageName: await systemService.getPackageName(),
          ),
          requestConfig: config,
        );
  }
}
