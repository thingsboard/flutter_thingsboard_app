import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_helper.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';

const _dashboardsPage = PageLayout(id: Pages.dashboards);

LoginState _customerWith({
  Map<String, Map<String, Object>> readGroupPermissions = const {},
}) {
  return LoginState(
    isUserLoaded: true,
    userScope: Authority.CUSTOMER_USER,
    userPermissions: standardSerializers.deserializeWith(
      AllowedPermissionsInfo.serializer,
      {
        'userPermissions': {
          'genericPermissions': <String, List<String>>{},
          'readGroupPermissions': readGroupPermissions,
        },
      },
    ),
  );
}

void main() {
  group('NavigationHelper.isPageVisible for dashboards', () {
    test('shows the item to a user with only a shared dashboard group', () {
      final login = _customerWith(
        readGroupPermissions: {
          'DASHBOARD': {
            'hasGenericRead': false,
            'entityGroupIds': [
              {
                'entityType': 'ENTITY_GROUP',
                'id': '784f394c-42b6-435a-983c-b7beff2784f9',
              },
            ],
          },
        },
      );

      expect(NavigationHelper.isPageVisible(_dashboardsPage, login), isTrue);
    });

    test('hides the item from a user without dashboard access', () {
      final login = _customerWith();

      expect(NavigationHelper.isPageVisible(_dashboardsPage, login), isFalse);
    });
  });
}
