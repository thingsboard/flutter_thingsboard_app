// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/widgets/header/login_header.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

import '../../../../../helpers/fake_wl.dart';

class MockEndpointService extends Mock implements IEndpointService {}

void main() {
  late MockEndpointService endpoints;

  setUp(() {
    endpoints = MockEndpointService();
    getIt.registerSingleton<IEndpointService>(endpoints);
    addTearDown(getIt.reset);
  });

  Future<void> pumpHeader(
    WidgetTester tester, {
    required String endpoint,
    required Region region,
    bool customLogo = false,
  }) async {
    when(() => endpoints.getCachedEndpoint()).thenReturn(endpoint);
    when(() => endpoints.getSelectedRegion()).thenAnswer((_) async => region);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          wlProvider.overrideWith(() => FakeWl(customLogo: customLogo)),
        ],
        child: const MaterialApp(
          localizationsDelegates: [S.delegate],
          home: Scaffold(body: LoginHeader()),
        ),
      ),
    );
  }

  /// The asset of the logo, checked on the first frame: the logo must not
  /// wait for the stored region, or the North America one shows first.
  String? logoAsset(WidgetTester tester) {
    final logos = tester.widgetList<SvgPicture>(find.byType(SvgPicture));
    if (logos.isEmpty) return null;
    return (logos.single.bytesLoader as SvgAssetLoader).assetName;
  }

  testWidgets('Europe shows the EU cloud logo from the first frame', (
    tester,
  ) async {
    await pumpHeader(
      tester,
      endpoint: EndpointService.europeHost,
      region: Region.europe,
    );

    expect(logoAsset(tester), ThingsboardImage.thingsBoardEUWithTitle);
  });

  testWidgets('North America shows the default logo', (tester) async {
    await pumpHeader(
      tester,
      endpoint: EndpointService.northAmericaHost,
      region: Region.northAmerica,
    );

    expect(logoAsset(tester), ThingsboardImage.thingsBoardWithTitle);
  });

  testWidgets('a white-labeled logo is kept in any region', (tester) async {
    await pumpHeader(
      tester,
      endpoint: EndpointService.europeHost,
      region: Region.europe,
      customLogo: true,
    );

    expect(logoAsset(tester), isNull);
    expect(find.byKey(const Key('custom-logo')), findsOneWidget);
  });
}
