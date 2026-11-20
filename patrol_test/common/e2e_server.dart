// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:built_value/json_object.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'e2e_env.dart';
import 'totp.dart';

typedef E2eUser = ({String email, String password, String customerId});

/// Test data on the E2E server, created through the REST API as the E2E
/// tenant administrator.
class E2eServer {
  E2eServer._(this._client);

  final ThingsboardClient _client;

  static const dashboardTitle = '${E2eEnv.entityPrefix}dashboard';

  /// Text of the only widget on [dashboardTitle]. The dashboard is a web
  /// view, so the tests look for this text through the native accessibility
  /// tree to tell a loaded dashboard from a failed one.
  static const dashboardMarker = 'e2e-ready';

  /// Signs in the tenant administrator once, with no retry: repeated failed
  /// sign-ins would lock the account for every later run.
  static Future<E2eServer> signIn() async {
    E2eEnv.check();
    final client = ThingsboardClient(E2eEnv.serverUrl);
    final LoginResponse response;
    try {
      response = await client.login(
        LoginRequest(
          (b) => b
            ..username = E2eEnv.tenantEmail
            ..password = E2eEnv.tenantPassword,
        ),
      );
    } on Exception catch (e) {
      throw TestFailure(
        'The E2E tenant administrator could not sign in to '
        '${E2eEnv.serverUrl}: $e\n'
        'Check E2E_TENANT_EMAIL and E2E_TENANT_PASSWORD, and that the account '
        'is active and not locked. Stopped without retrying.',
      );
    }
    if (response.scope != null) {
      throw TestFailure(
        'The E2E tenant administrator has two-factor login '
        '(${response.scope}). Turn it off for this account.',
      );
    }
    return E2eServer._(client);
  }

  /// Creates [dashboardTitle] unless the tenant already has it.
  Future<void> ensureDashboard() async {
    final api = _client.getDashboardControllerApi();
    final page = (await api.getTenantDashboards(
      pageSize: 10,
      page: 0,
      textSearch: dashboardTitle,
    )).data!;
    if (page.data?.any((d) => d.title == dashboardTitle) ?? false) {
      return;
    }
    await api.saveDashboard(
      dashboard: Dashboard(
        (b) => b
          ..title = dashboardTitle
          ..configuration = JsonObject(_dashboardConfiguration()),
      ),
    );
  }

  /// Creates a customer with one activated customer user in the customer's
  /// [userGroup]. Deleting the customer with [deleteCustomer] also deletes the
  /// user and everything else the customer owns.
  ///
  /// `Customer Users` can only read; `Customer Administrators` can also act,
  /// for example acknowledge alarms.
  Future<E2eUser> createCustomerUser({
    String userGroup = customerUsersGroup,
  }) async {
    final name = '${E2eEnv.entityPrefix}${E2eEnv.runId}-customer';
    final customer = (await _client.getCustomerControllerApi().saveCustomer(
      customer: Customer((b) => b..title = name),
    )).data!;
    final customerId = customer.id!;
    try {
      // The customer's own user group carries the Customer User role; a user
      // outside it signs in with no permissions.
      final group =
          (await _client
                  .getEntityGroupControllerApi()
                  .getEntityGroupByOwnerAndNameAndType(
                    ownerType: 'CUSTOMER',
                    ownerId: customerId.id,
                    groupType: 'USER',
                    groupName: userGroup,
                  ))
              .data!;
      final email = '$name@example.com';
      final userApi = _client.getUserControllerApi();
      final user = (await userApi.saveUser(
        user: User(
          (b) => b
            ..email = email
            ..authority = Authority.CUSTOMER_USER
            ..customerId.replace(customerId),
        ),
        sendActivationMail: 'false',
        entityGroupId: group.id!.id,
      )).data!;
      final link = (await userApi.getActivationLink(userId: user.id!.id)).data!;
      final password = _newPassword();
      await _client.getAuthControllerApi().activateUser(
        activateUserRequest: ActivateUserRequest(
          (b) => b
            ..activateToken = Uri.parse(link).queryParameters['activateToken']
            ..password = password,
        ),
        sendActivationMail: false,
      );
      return (email: email, password: password, customerId: customerId.id);
    } on Exception {
      await deleteCustomer(customerId.id);
      rethrow;
    }
  }

  static const customerUsersGroup = 'Customer Users';
  static const customerAdministratorsGroup = 'Customer Administrators';

  /// Type of the alarm [createCustomerAlarm] raises.
  static const alarmType = '${E2eEnv.entityPrefix}alarm';

  /// Creates a copy of the E2E dashboard owned by the customer and makes it
  /// the customer's home dashboard, so its users land on it after sign-in.
  Future<void> setCustomerHomeDashboard(String customerId) async {
    final dashboard = (await _client.getDashboardControllerApi().saveDashboard(
      dashboard: Dashboard(
        (b) => b
          ..title = dashboardTitle
          ..customerId.replace(_customerId(customerId))
          ..configuration = JsonObject(_dashboardConfiguration()),
      ),
      entityGroupId: await _customerGroupId(customerId, 'DASHBOARD', 'All'),
    )).data!;
    final customerApi = _client.getCustomerControllerApi();
    final customer = (await customerApi.getCustomerById(customerId: customerId))
        .data!;
    final info = {
      ...?(customer.additionalInfo?.value as Map?)?.cast<String, Object?>(),
      'homeDashboardId': dashboard.id!.id,
      'homeDashboardHideToolbar': true,
    };
    await customerApi.saveCustomer(
      customer: customer.rebuild((b) => b..additionalInfo = JsonObject(info)),
    );
  }

  /// Raises an active, unacknowledged [alarmType] alarm on a new device owned
  /// by the customer.
  Future<void> createCustomerAlarm(String customerId) async {
    final device = (await _client.getDeviceControllerApi().saveDevice(
      device: Device(
        (b) => b
          ..name = '${E2eEnv.entityPrefix}${E2eEnv.runId}-device'
          ..type = 'default'
          ..customerId.replace(_customerId(customerId)),
      ),
      entityGroupId: await _customerGroupId(customerId, 'DEVICE', 'All'),
    )).data!;
    await _client.getAlarmControllerApi().saveAlarm(
      alarm: Alarm(
        (b) => b
          ..type = alarmType
          ..name = alarmType
          ..originator = device.id
          ..severity = AlarmSeverity.MAJOR
          ..status = AlarmStatus.ACTIVE_UNACK
          ..acknowledged = false
          ..cleared = false,
      ),
    );
  }

  /// Turns on TOTP two-factor login for [user] and returns the generator for
  /// its codes. TOTP must be allowed in the server's platform settings.
  static Future<Totp> enableTotp(E2eUser user) async {
    final client = await _signInAs(user);
    final api = client.getTwoFactorAuthConfigControllerApi();
    final config =
        (await api.generateTwoFaAccountConfig(providerType: 'TOTP')).data!
            as TotpTwoFaAccountConfig;
    final totp = Totp.fromAuthUrl(config.authUrl);
    await api.verifyAndSaveTwoFaAccountConfig(
      twoFaAccountConfig: config,
      verificationCode: totp.now(),
    );
    return totp;
  }

  /// Ends every session of [user] on the server the way a password change
  /// does: tokens issued before it stop working, including the app's.
  static Future<void> endSessions(E2eUser user) async {
    final client = await _signInAs(user);
    // The server rejects tokens issued in the same second as the change.
    await Future<void>.delayed(const Duration(seconds: 1));
    await client.changePassword(user.password, _newPassword());
  }

  static Future<ThingsboardClient> _signInAs(E2eUser user) async {
    final client = ThingsboardClient(E2eEnv.serverUrl);
    await client.login(
      LoginRequest(
        (b) => b
          ..username = user.email
          ..password = user.password,
      ),
    );
    return client;
  }

  Future<String> _customerGroupId(
    String customerId,
    String groupType,
    String groupName,
  ) async {
    final group =
        (await _client
                .getEntityGroupControllerApi()
                .getEntityGroupByOwnerAndNameAndType(
                  ownerType: 'CUSTOMER',
                  ownerId: customerId,
                  groupType: groupType,
                  groupName: groupName,
                ))
            .data!;
    return group.id!.id;
  }

  static CustomerId _customerId(String id) => CustomerId((b) => b..id = id);

  Future<void> deleteCustomer(String customerId) =>
      _client.getCustomerControllerApi().deleteCustomer(customerId: customerId);

  /// Deletes customers that runs older than a day left behind, for example
  /// after a cancelled job.
  Future<void> deleteStaleCustomers() async {
    final page = (await _client.getCustomerControllerApi().getCustomers(
      pageSize: 100,
      page: 0,
      textSearch: E2eEnv.entityPrefix,
    )).data!;
    final dayAgo = DateTime.now()
        .subtract(const Duration(days: 1))
        .millisecondsSinceEpoch;
    for (final customer in page.data ?? const <Customer>[]) {
      if (customer.title.startsWith(E2eEnv.entityPrefix) &&
          (customer.createdTime ?? dayAgo) < dayAgo) {
        await deleteCustomer(customer.id!.id);
      }
    }
  }

  static String _newPassword() {
    const chars = 'abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final random = Random.secure();
    final body = List.generate(
      16,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
    // Covers the usual policy rules: upper and lower case, a digit, a symbol.
    return 'Aa1!$body';
  }

  static Map<String, Object?> _dashboardConfiguration() {
    const widgetId = 'e2e00000-0000-4000-8000-000000000001';
    return {
      'description': 'E2E tests of the mobile app. Recreated when missing.',
      'widgets': {
        widgetId: {
          'id': widgetId,
          'typeFullFqn': 'system.cards.html_card',
          'type': 'static',
          'sizeX': 8,
          'sizeY': 4,
          'row': 0,
          'col': 0,
          'config': {
            'datasources': <Object>[],
            'showTitle': false,
            'title': dashboardMarker,
            'backgroundColor': '#ffffff',
            'color': 'rgba(0, 0, 0, 0.87)',
            'padding': '16px',
            'dropShadow': true,
            'enableFullscreen': false,
            'settings': {
              'cardHtml': '<div>$dashboardMarker</div>',
              'cardCss': 'div { font-size: 20px; }',
            },
          },
        },
      },
      'states': {
        'default': {
          'name': dashboardTitle,
          'root': true,
          'layouts': {
            'main': {
              'widgets': {
                widgetId: {'sizeX': 8, 'sizeY': 4, 'row': 0, 'col': 0},
              },
              'gridSettings': {
                'backgroundColor': '#eeeeee',
                'columns': 24,
                'margin': 10,
                'outerMargin': true,
              },
            },
          },
        },
      },
      'entityAliases': <String, Object>{},
      'filters': <String, Object>{},
      'timewindow': {
        'realtime': {'timewindowMs': 60000},
      },
      'settings': {
        'stateControllerId': 'entity',
        'showTitle': false,
        'showDashboardsSelect': false,
        'showEntitiesSelect': false,
        'showDashboardTimewindow': false,
        'showDashboardExport': false,
        'toolbarAlwaysOpen': false,
      },
    };
  }
}
