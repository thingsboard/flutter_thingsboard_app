import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';

part 'navigation_provider.g.dart';

@riverpod
class Navigation extends _$Navigation {
  List<PageLayout> _pagesLayout = [];
  Size _deviceScreenSize = Size.zero;
  final _logger = TbLogger();
  List<NavigationItemData> _allPages = [];
  late final StreamSubscription<NativeDeviceOrientation>
  _orientationSubscription;
  @override
  NavigationState build() {
    final login = ref.read(loginProvider);

    // `ref.listen` rather than `ref.watch`: rebuilding this provider on every
    // login emission would tear down and re-create `_orientationSubscription`.
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
    });
    if (!login.isUserLoaded || login.mobileLoginInfo == null) {
      return const NavigationState(bottomBarPages: [], morePages: []);
    }
    return _getPages(login);
  }

  /// Primes the page layout from the current login state and returns the path
  /// of the first bottom bar page, or null when there is nothing to open yet.
  /// [build] does not prime the layout, so callers that navigate right after a
  /// login must go through here instead of reading [state] directly.
  String? resolveHomePath() {
    onLoggedIn();

    return state.bottomBarPages.firstOrNull?.path;
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
      const tenantPages = [
        PageLayout(id: Pages.home),
        PageLayout(id: Pages.alarms),
        PageLayout(id: Pages.devices),
      ];
      _pagesLayout = switch (authority) {
        Authority.SYS_ADMIN => [
          const PageLayout(id: Pages.home),
          const PageLayout(id: Pages.notifications),
          const PageLayout(id: Pages.audit_logs),
        ],
        Authority.TENANT_ADMIN => [
          ...tenantPages,
          const PageLayout(id: Pages.customers),
          const PageLayout(id: Pages.assets),
          const PageLayout(id: Pages.audit_logs),
          const PageLayout(id: Pages.notifications),
        ],
        Authority.CUSTOMER_USER => [
          ...tenantPages,
          const PageLayout(id: Pages.assets),
          const PageLayout(id: Pages.notifications),
        ],
        _ => [...tenantPages],
      };
    } else {
      _pagesLayout = List.of(pages);
    }
  }

  NavigationState _getPages(LoginState login) {
    final visibleLayouts = <PageLayout>[];
    final hiddenPageIds = <String?>[];
    for (final pageLayout in _pagesLayout) {
      if (NavigationHelper.isPageVisible(pageLayout, login)) {
        visibleLayouts.add(pageLayout);
      } else {
        hiddenPageIds.add(pageLayout.id?.name ?? pageLayout.label);
      }
    }
    if (hiddenPageIds.isNotEmpty) {
      _logger.debug('Navigation pages hidden: $hiddenPageIds');
    }
    _allPages = visibleLayouts.map(NavigationHelper.toNavigationItem).toList();
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
              path: morePath,
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
    state = _getPages(ref.read(loginProvider));
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
