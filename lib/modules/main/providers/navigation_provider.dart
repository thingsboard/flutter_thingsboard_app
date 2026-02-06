import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/main/model/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/model/navigation_state.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_helper.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

part 'navigation_provider.g.dart';

const fullScreenProfile = '/profile?fullscreen=true';

@riverpod
class Navigation extends _$Navigation {
  List<PageLayout> _pagesLayout = [];
  Size _deviceScreenSize = Size.zero;
  final _logger = TbLogger();
  List<NavigationItemData> _allPages = [];
  late final StreamSubscription<NativeDeviceOrientation>
  _orientationSubscription;
  late final ProviderSubscription<LoginState> _loginSub;
  @override
  NavigationState build() {
    final login = ref.read(loginProvider);

    ref.listen(loginProvider, (prev, next) {
      onLoggedIn();
    });

    _orientationSubscription = NativeDeviceOrientationCommunicator()
        .onOrientationChanged()
        .listen((e) async {
          await Future.delayed(const Duration(seconds: 1));
          _updateScreenSize();
          updatePages();
        });
    ref.onDispose(() {
      _orientationSubscription.cancel();
      _loginSub.close();
    });
    if (!login.isUserLoaded || login.mobileLoginInfo == null) {
      return const NavigationState(bottomBarPages: [], morePages: []);
    }
    return _getPages(_pagesLayout);
  }

  void onLoggedIn() {
    final login = ref.read(loginProvider);
    if (login.mobileLoginInfo != null && login.userScope != null) {
      _cachePageLayouts(
        login.mobileLoginInfo!.pages,
        authority: login.userScope!,
      );
      updatePages();
    }
  }

  void _cachePageLayouts(
    List<PageLayout>? pages, {
    required Authority authority,
  }) {
    if (pages == null) {
      _pagesLayout = [
        const PageLayout(id: Pages.home),
        const PageLayout(id: Pages.alarms),
        const PageLayout(id: Pages.devices),
      ];

      if (authority == Authority.SYS_ADMIN) {
        _pagesLayout.add(const PageLayout(id: Pages.notifications));
        _pagesLayout.removeWhere((e) => e.id == Pages.alarms);
      } else if (authority == Authority.TENANT_ADMIN) {
        _pagesLayout.addAll([
          const PageLayout(id: Pages.customers),
          const PageLayout(id: Pages.assets),
          const PageLayout(id: Pages.audit_logs),
          const PageLayout(id: Pages.notifications),
        ]);
      } else if (authority == Authority.CUSTOMER_USER) {
        _pagesLayout.addAll([
          const PageLayout(id: Pages.assets),
          const PageLayout(id: Pages.notifications),
        ]);
      }
    } else {
      _pagesLayout = List.of(pages);
    }
  }

  NavigationState _getPages(List<PageLayout> layouts) {
    _allPages =
        layouts
            .map(
              (pageLayout) => NavigationItemData(
                title: NavigationHelper.getLabel(pageLayout),
                icon: NavigationHelper.getIcon(pageLayout),
                path: NavigationHelper.getPath(pageLayout),
                id: pageLayout.id?.name,
                showNotificationBadge: pageLayout.id == Pages.notifications,
              ),
            )
            .toList();
    final bool shouldAddProfile =
        _allPages.length < 4 &&
        _allPages.firstWhereOrNull((e) {
              return e.path.contains(fullScreenProfile);
            }) ==
            null;
    final more =
        shouldAddProfile
            ? const NavigationItemData(
              title: 'Profile',
              icon: Icons.person,
              path: fullScreenProfile,
            )
            : const NavigationItemData(
              title: 'More',
              icon: Icons.menu_outlined,
              path: '/more',
            );
    NavigationState navState = const NavigationState(
      bottomBarPages: [],
      morePages: [],
    );
    if (_deviceScreenSize.width < 600) {
      navState = navState.copyWith(
        bottomBarPages:
            _allPages.length > 3
                ? [..._allPages.sublist(0, 3), more]
                : [..._allPages, more],
      );
      navState = navState.copyWith(
        morePages: _getMorePages(navState.bottomBarPages),
      );
      return navState;
    }
    if (_deviceScreenSize.width < 960) {
      navState = navState.copyWith(
        bottomBarPages:
            _allPages.length > 5
                ? [..._allPages.sublist(0, 5), more]
                : [..._allPages, more],
      );

      navState = navState.copyWith(
        morePages: _getMorePages(navState.bottomBarPages),
      );
      return navState;
    }

    navState = navState.copyWith(
      bottomBarPages:
          _allPages.length > 9
              ? [..._allPages.sublist(0, 9), more]
              : [..._allPages, more],
    );
    navState = navState.copyWith(
      morePages: _getMorePages(navState.bottomBarPages),
    );
    return navState;
  }

  void updatePages() {
    state = _getPages(_pagesLayout);
  }

  List<NavigationItemData> _getMorePages(List<NavigationItemData> elements) {
    final allItems = Set.of(_allPages);
    final bottomBarElements = Set.of(elements);
    return allItems.difference(bottomBarElements).toList();
  }

  void _updateScreenSize() {
    if (globalNavigatorKey.currentContext != null) {
      final q = MediaQuery.of(globalNavigatorKey.currentContext!);
      _deviceScreenSize = q.size;
    }
  }
}
