// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/content_direction.dart';

Future<BuildContext> _context(WidgetTester tester, TextDirection layout) async {
  late BuildContext context;
  await tester.pumpWidget(
    Directionality(
      textDirection: layout,
      child: Builder(
        builder: (c) {
          context = c;
          return const SizedBox();
        },
      ),
    ),
  );
  return context;
}

void main() {
  testWidgets('the first strong character decides, like dir="auto"', (
    tester,
  ) async {
    final context = await _context(tester, TextDirection.rtl);
    expect(contentDirection(context, 'Weather Station'), TextDirection.ltr);
    expect(contentDirection(context, '16A Switch'), TextDirection.ltr);
    expect(contentDirection(context, 'محطة الطقس'), TextDirection.rtl);
  });

  testWidgets('text without a strong character follows the layout', (
    tester,
  ) async {
    final rtl = await _context(tester, TextDirection.rtl);
    expect(contentDirection(rtl, '888'), TextDirection.rtl);
    expect(contentDirection(rtl, null), TextDirection.rtl);
    final ltr = await _context(tester, TextDirection.ltr);
    expect(contentDirection(ltr, '888'), TextDirection.ltr);
  });

  testWidgets('layout start and end are absolute sides', (tester) async {
    final rtl = await _context(tester, TextDirection.rtl);
    expect(layoutStart(rtl), TextAlign.right);
    expect(layoutEnd(rtl), TextAlign.left);
    final ltr = await _context(tester, TextDirection.ltr);
    expect(layoutStart(ltr), TextAlign.left);
    expect(layoutEnd(ltr), TextAlign.right);
  });
}
