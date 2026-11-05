import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

/// Builds the login state from a payload shaped like the server's
/// `/api/permissions/allowedPermissions` response.
LoginState _loginWith({
  Map<String, List<String>> genericPermissions = const {},
  Map<String, Map<String, Object>> readGroupPermissions = const {},
  List<String>? allowedResources,
}) {
  return LoginState(
    isUserLoaded: true,
    userScope: Authority.CUSTOMER_USER,
    userPermissions: standardSerializers.deserializeWith(
      AllowedPermissionsInfo.serializer,
      {
        if (allowedResources != null) 'allowedResources': allowedResources,
        'userPermissions': {
          'genericPermissions': genericPermissions,
          'readGroupPermissions': readGroupPermissions,
        },
      },
    ),
  );
}

const _groupId = '784f394c-42b6-435a-983c-b7beff2784f9';

Map<String, Object> _sharedGroups(
  List<String> groupIds, {
  bool hasGenericRead = false,
}) {
  return {
    'hasGenericRead': hasGenericRead,
    'entityGroupIds': [
      for (final id in groupIds) {'entityType': 'ENTITY_GROUP', 'id': id},
    ],
  };
}

void main() {
  group('LoginState.canReadDashboards', () {
    test('is false before the permissions are loaded', () {
      expect(const LoginState(isUserLoaded: false).canReadDashboards, isFalse);
    });

    test('is true with generic dashboard read', () {
      final login = _loginWith(
        genericPermissions: {
          'DASHBOARD': ['READ'],
        },
      );

      expect(login.canReadDashboards, isTrue);
    });

    test('is true with the allowed ALL wildcard', () {
      final login = _loginWith(
        genericPermissions: {
          'ALL': ['ALL'],
        },
        allowedResources: ['DASHBOARD'],
      );

      expect(login.canReadDashboards, isTrue);
    });

    test('is true when a dashboard group is shared via a group role', () {
      final login = _loginWith(
        readGroupPermissions: {
          'DASHBOARD': _sharedGroups([_groupId]),
        },
      );

      expect(login.canReadDashboards, isTrue);
    });

    test('is false with only generic device read', () {
      final login = _loginWith(
        genericPermissions: {
          'DEVICE': ['READ'],
        },
      );

      expect(login.canReadDashboards, isFalse);
    });

    test('is false with only a shared device group', () {
      final login = _loginWith(
        readGroupPermissions: {
          'DEVICE': _sharedGroups([_groupId]),
        },
      );

      expect(login.canReadDashboards, isFalse);
    });

    test(
      'hasGenericRead alone does not grant without shared dashboard groups',
      () {
        final login = _loginWith(
          readGroupPermissions: {
            'DASHBOARD': _sharedGroups([], hasGenericRead: true),
          },
        );

        expect(login.canReadDashboards, isFalse);
      },
    );

    test('ignores the ALL wildcard when dashboards are not allowed', () {
      final login = _loginWith(
        genericPermissions: {
          'ALL': ['ALL'],
        },
        allowedResources: ['DEVICE'],
      );

      expect(login.canReadDashboards, isFalse);
    });
  });
}
