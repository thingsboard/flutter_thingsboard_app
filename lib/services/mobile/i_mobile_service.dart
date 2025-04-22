import 'package:flutter/material.dart' show Orientation, Size, BuildContext;
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show LoginMobileInfo, MobileBasicInfo, PageLayout, RequestConfig;
import 'package:thingsboard_client/thingsboard_client.dart' show Authority;

abstract interface class IMobileService {
  List<TbMainNavigationItem> getBottomBarItems();

  void setDeviceScreenSize(Size size, {required Orientation orientation});

  void setBottomBarItems(
    List<TbMainNavigationItem> items, {
    required TbMainNavigationItem more,
  });

  List<TbMainNavigationItem> getMorePageItems(
    TbContext tbContext,
    BuildContext context,
  );

  void cachePageLayouts(
    List<PageLayout>? pages, {
    required Authority authority,
  });

  List<PageLayout> getCachedPageLayouts();

  Future<MobileBasicInfo?> getUserMobileInfo({RequestConfig? config});

  Future<LoginMobileInfo?> getLoginMobileInfo({RequestConfig? config});
}
