import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/route_extra_codec.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class _Refresh extends ChangeNotifier {
  void fire() => notifyListeners();
}

const _dashboardArgs = DashboardArgumentsEntity(
  id: 'dashboard-1',
  title: 'Pump',
  state: 'W3siaWQiOiJkZWZhdWx0In1d',
  hideToolbar: false,
  animate: false,
);

void main() {
  const codec = RouteExtraCodec();

  group('RouteExtraCodec', () {
    test('round-trips DashboardArgumentsEntity', () {
      expect(codec.decode(codec.encode(_dashboardArgs)), _dashboardArgs);
    });

    test('round-trips AuditLog', () {
      final auditLog = AuditLog(
        (b) =>
            b
              ..entityName = 'Pump'
              ..userName = 'tenant@thingsboard.org'
              ..actionType = ActionType.ADDED
              ..actionStatus = ActionStatus.SUCCESS
              ..createdTime = 1700000000000,
      );
      expect(codec.decode(codec.encode(auditLog)), auditLog);
    });

    test('keeps a null extra as null', () {
      expect(codec.encode(null), isNull);
      expect(codec.decode(null), isNull);
    });

    test('drops an extra of an unsupported type instead of throwing', () {
      expect(codec.encode(Object()), isNull);
    });

    test('encodes to JSON primitives only', () {
      expect(() => jsonEncode(codec.encode(_dashboardArgs)), returnsNormally);
    });
  });

  testWidgets('dashboard extra survives a GoRouter refresh', (tester) async {
    final refresh = _Refresh();
    final seen = <Object?>[];
    final router = GoRouter(
      extraCodec: codec,
      refreshListenable: refresh,
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SizedBox()),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            seen.add(state.extra);
            return const SizedBox();
          },
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    router.push('/dashboard', extra: _dashboardArgs);
    await tester.pumpAndSettle();
    expect(seen.last, _dashboardArgs);

    refresh.fire();
    await tester.pumpAndSettle();
    expect(seen.last, _dashboardArgs);
  });
}
