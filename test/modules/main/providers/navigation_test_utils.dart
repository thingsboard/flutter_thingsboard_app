import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/models/mobile_basic_info.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';

/// Built from the wire format of `/api/permissions/allowedPermissions`, the
/// way the client receives it.
AllowedPermissionsInfo permissions(
  Map<Resource, Set<Operation>> generic, {
  Set<EntityType> sharedGroups = const {},
  Set<Resource>? allowedResources,
}) =>
    standardSerializers.deserializeWith(AllowedPermissionsInfo.serializer, {
      if (allowedResources != null)
        'allowedResources': [for (final r in allowedResources) r.name],
      'userPermissions': {
        'genericPermissions': {
          for (final entry in generic.entries)
            entry.key.name: [for (final op in entry.value) op.name],
        },
        'readGroupPermissions': {
          for (final type in sharedGroups)
            type.name: {
              'entityGroupIds': [
                {'entityType': 'ENTITY_GROUP', 'id': 'group-1'},
              ],
            },
        },
      },
    })!;

LoginState loginAs(Authority authority, [AllowedPermissionsInfo? perms]) =>
    LoginState(
      isUserLoaded: true,
      userScope: authority,
      userPermissions: perms,
      mobileLoginInfo: const MobileBasicInfo(),
    );

final fullAccessTenantAdmin = loginAs(
  Authority.TENANT_ADMIN,
  permissions({
    Resource.ALL: {Operation.ALL},
  }),
);

const customPages = [
  PageLayout(id: Pages.undefined, label: 'Dashboard', dashboardId: 'dash-1'),
  PageLayout(id: Pages.undefined, label: 'Web', url: 'https://example.com'),
  PageLayout(id: Pages.undefined, label: 'Custom', path: '/alarmDetails/1'),
  PageLayout(label: 'No id', dashboardId: 'dash-2'),
];
