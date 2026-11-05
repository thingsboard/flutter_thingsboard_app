import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_helper.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';

import 'navigation_test_utils.dart';

final builtInPages = Pages.values.where((p) => p != Pages.undefined).toList();

const sysAdminPages = {Pages.home, Pages.notifications, Pages.audit_logs};

Set<Pages> visibleBuiltInPages(LoginState login) => {
  for (final id in builtInPages)
    if (NavigationHelper.isPageVisible(PageLayout(id: id), login)) id,
};

void expectCustomPagesVisible(LoginState login) {
  for (final page in customPages) {
    expect(
      NavigationHelper.isPageVisible(page, login),
      isTrue,
      reason: page.label,
    );
  }
}

void main() {
  group('NavigationHelper.isPageVisible', () {
    group('sysadmin', () {
      // What the server sends SYS_ADMIN: no generic ALL grant, but ALARM and
      // DASHBOARD read are included, so RBAC alone would not hide those pages.
      // `allowedResources` is the page-relevant part of the server's
      // `Resource.resourcesByAuthority`: no DEVICE, ASSET, CUSTOMER or
      // DEVICE_PROFILE.
      final sysAdmin = loginAs(
        Authority.SYS_ADMIN,
        permissions(
          {
            Resource.ALARM: {Operation.READ},
            Resource.DASHBOARD: {Operation.READ},
            Resource.AUDIT_LOG: {Operation.READ},
          },
          allowedResources: {Resource.ALL, Resource.ALARM, Resource.DASHBOARD},
        ),
      );

      test('shows only the allowlisted built-in pages', () {
        expect(visibleBuiltInPages(sysAdmin), sysAdminPages);
      });

      test('shows custom pages', () {
        expectCustomPagesVisible(sysAdmin);
      });

      test('hides a page id unknown to this app version', () {
        expect(
          NavigationHelper.isPageVisible(
            const PageLayout(id: Pages.undefined, label: 'Unknown'),
            sysAdmin,
          ),
          isFalse,
        );
      });

      test('applies the allowlist before permissions are loaded', () {
        expect(
          visibleBuiltInPages(loginAs(Authority.SYS_ADMIN)),
          sysAdminPages,
        );
      });
    });

    test('tenant admin with full permissions sees every page', () {
      expect(visibleBuiltInPages(fullAccessTenantAdmin), builtInPages.toSet());
      expectCustomPagesVisible(fullAccessTenantAdmin);
    });

    test('customer user sees pages backed by their permissions', () {
      final customerUser = loginAs(
        Authority.CUSTOMER_USER,
        permissions(
          {
            Resource.ALARM: {Operation.READ},
          },
          sharedGroups: {EntityType.DEVICE, EntityType.DASHBOARD},
        ),
      );

      expect(visibleBuiltInPages(customerUser), {
        Pages.home,
        Pages.alarms,
        Pages.notifications,
        Pages.device_list,
        Pages.dashboards,
        Pages.live_location_tracking,
      });
      expectCustomPagesVisible(customerUser);
    });

    test('non-sysadmin pages fail open before permissions are loaded', () {
      expect(
        visibleBuiltInPages(loginAs(Authority.CUSTOMER_USER)),
        builtInPages.toSet(),
      );
    });
  });
}
