// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_helper.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'navigation_provider.g.dart';

@riverpod
class Navigation extends _$Navigation {
  List<PageLayout> _pagesLayout = [];
  Size _deviceScreenSize = Size.zero;
  final _logger = TbLogger();
  List<NavigationItemData> _allPages = [];
  @override
  NavigationState build() {
    final login = ref.read(loginProvider);

    // `ref.listen` rather than `ref.watch`: the pages are rebuilt by
    // [onLoggedIn], and a rebuild would forget the reported screen size.
    ref.listen(loginProvider, (prev, next) {
      onLoggedIn();
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
    final more = shouldAddProfile
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
        bottomBarPages: _allPages.length > 3
            ? [..._allPages.sublist(0, 3), more]
            : [..._allPages, more],
      );
      navState = navState.copyWith(
        morePages: _getMorePages(navState.bottomBarPages),
      );
      return _withMoreBadge(navState);
    }
    if (_deviceScreenSize.width < 960) {
      navState = navState.copyWith(
        bottomBarPages: _allPages.length > 5
            ? [..._allPages.sublist(0, 5), more]
            : [..._allPages, more],
      );

      navState = navState.copyWith(
        morePages: _getMorePages(navState.bottomBarPages),
      );
      return _withMoreBadge(navState);
    }

    navState = navState.copyWith(
      bottomBarPages: _allPages.length > 9
          ? [..._allPages.sublist(0, 9), more]
          : [..._allPages, more],
    );
    navState = navState.copyWith(
      morePages: _getMorePages(navState.bottomBarPages),
    );
    return _withMoreBadge(navState);
  }

  /// The More (or Profile) item shows the unread notifications badge when
  /// the Notifications page is one of the pages behind it.
  NavigationState _withMoreBadge(NavigationState navState) {
    if (!navState.morePages.any((p) => p.showNotificationBadge)) {
      return navState;
    }
    final pages = [...navState.bottomBarPages];
    final more = pages.last;
    pages[pages.length - 1] = NavigationItemData(
      title: more.title,
      icon: more.icon,
      path: more.path,
      id: more.id,
      label: more.label,
      showNotificationBadge: true,
    );
    return navState.copyWith(bottomBarPages: pages);
  }

  void updatePages() {
    state = _getPages(ref.read(loginProvider));
  }

  List<NavigationItemData> _getMorePages(List<NavigationItemData> elements) {
    final allItems = Set.of(_allPages);
    final bottomBarElements = Set.of(elements);
    return allItems.difference(bottomBarElements).toList();
  }

  /// Reported by [NavigationPage]; the number of tabs depends on the width.
  void setScreenSize(Size size) {
    if (size == _deviceScreenSize) {
      return;
    }
    _deviceScreenSize = size;
    if (_pagesLayout.isNotEmpty) {
      updatePages();
    }
  }
}
