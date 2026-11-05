// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/core/auth/login/login_theme.dart';

// Built inside each widget test: the base theme resolves its Google Fonts,
// and only the widget test zone turns that fetch into a logged failure.
ThemeData baseTheme() => tbTheme(Colors.indigo, Colors.indigo, Colors.amber);

void main() {
  group('loginPageTheme', () {
    testWidgets('paints the page with the primary palette and the sign-in '
        'button with the accent', (_) async {
      final theme = loginPageTheme(baseTheme(), darkForeground: false);

      expect(theme.scaffoldBackgroundColor, Colors.indigo);
      expect(
        theme.elevatedButtonTheme.style!.backgroundColor!.resolve({}),
        Colors.amber,
      );
    });

    testWidgets('uses a light foreground unless dark foreground is requested', (
      _,
    ) async {
      final light = loginPageTheme(baseTheme(), darkForeground: false);
      final dark = loginPageTheme(baseTheme(), darkForeground: true);

      expect(
        light.textTheme.bodyLarge!.color,
        Colors.white.withValues(alpha: 0.87),
      );
      expect(
        dark.textTheme.bodyLarge!.color,
        Colors.black.withValues(alpha: 0.87),
      );
    });

    testWidgets('picks a readable sign-in text color for the accent', (
      _,
    ) async {
      Color? onAccent(Color accent) => loginPageTheme(
        tbTheme(Colors.indigo, Colors.indigo, accent),
        darkForeground: false,
      ).elevatedButtonTheme.style!.foregroundColor!.resolve({});

      expect(onAccent(Colors.amber), Colors.black87);
      expect(onAccent(Colors.indigo), Colors.white);
    });

    testWidgets('makes the error color readable without washing it out', (
      _,
    ) async {
      double contrast(Color a, Color b) {
        final la = a.computeLuminance();
        final lb = b.computeLuminance();
        return (max(la, lb) + 0.05) / (min(la, lb) + 0.05);
      }

      Color error(MaterialColor page, {required bool darkForeground}) =>
          loginPageTheme(
            tbTheme(page, page, Colors.amber),
            darkForeground: darkForeground,
          ).inputDecorationTheme.errorStyle!.color!;

      for (final (page, darkForeground) in [
        (Colors.indigo, false),
        (Colors.purple, false),
        (Colors.amber, true),
        (Colors.lightGreen, true),
      ]) {
        expect(
          contrast(error(page, darkForeground: darkForeground), page),
          inInclusiveRange(4, 4.3),
          reason: 'error on $page',
        );
      }

      // Even white text misses 4:1 on red (3.7:1): the error gets lighter but
      // stays distinct from the foreground.
      final onRed = error(Colors.red, darkForeground: false);
      expect(
        contrast(onRed, Colors.red),
        greaterThan(contrast(AppColors.textError, Colors.red)),
      );
      expect(onRed, isNot(Colors.white));
    });

    testWidgets('keeps the disabled look of the sign-in button', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: loginPageTheme(baseTheme(), darkForeground: false),
          home: Scaffold(
            body: Column(
              children: [
                const ElevatedButton(onPressed: null, child: Text('disabled')),
                ElevatedButton(onPressed: () {}, child: const Text('enabled')),
              ],
            ),
          ),
        ),
      );

      Color? buttonColor(String label) =>
          tester
              .widget<Material>(
                find
                    .ancestor(
                      of: find.text(label),
                      matching: find.byType(Material),
                    )
                    .first,
              )
              .color;

      expect(buttonColor('enabled'), Colors.amber);
      expect(buttonColor('disabled'), isNot(Colors.amber));
    });
  });
}
