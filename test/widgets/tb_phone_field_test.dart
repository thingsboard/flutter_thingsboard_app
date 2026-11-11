// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_phone_field.dart';

void main() {
  testWidgets('in Arabic the phone number still reads left to right', (
    tester,
  ) async {
    final number = PhoneNumber.parse('+12025550123');
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          ...PhoneFieldLocalization.delegates,
        ],
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: ReactiveForm(
            formGroup: FormGroup({
              'phone': FormControl<PhoneNumber>(value: number),
            }),
            child: TbPhoneField(
              controller: PhoneController(initialValue: number),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final field = tester.widget<EditableText>(find.byType(EditableText));
    expect(field.controller.text, contains('555'));
    expect(
      Directionality.of(tester.element(find.byType(EditableText))),
      TextDirection.ltr,
    );
    expect(find.text('+ 1'), findsOneWidget);
  });

  test('the Arabic hint shows the example number with its + in front', () {
    final hint = lookupS(const Locale('ar')).phoneNumberHelperText;
    final painter = TextPainter(
      text: TextSpan(text: hint),
      textDirection: TextDirection.rtl,
    )..layout();
    addTearDown(painter.dispose);

    double leftOf(int i) => painter
        .getBoxesForSelection(TextSelection(baseOffset: i, extentOffset: i + 1))
        .first
        .left;
    final plus = hint.indexOf('+');

    expect(leftOf(plus), lessThan(leftOf(plus + 1)));
  });

  testWidgets('in Arabic the hint under the field reads right to left', (
    tester,
  ) async {
    final number = PhoneNumber.parse('+12025550123');
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          ...PhoneFieldLocalization.delegates,
        ],
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: ReactiveForm(
            formGroup: FormGroup({
              'phone': FormControl<PhoneNumber>(value: number),
            }),
            child: TbPhoneField(
              controller: PhoneController(initialValue: number),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final hint = find.textContaining('E.164');
    expect(Directionality.of(tester.element(hint)), TextDirection.rtl);
    final field = tester.getRect(find.byType(TbPhoneField));
    expect(field.right - tester.getRect(hint).right, lessThan(24));
    final theme = Theme.of(tester.element(hint));
    expect(
      tester.widget<Text>(hint).style?.color,
      theme.inputDecorationTheme.helperStyle?.color ?? theme.hintColor,
    );
  });
}
