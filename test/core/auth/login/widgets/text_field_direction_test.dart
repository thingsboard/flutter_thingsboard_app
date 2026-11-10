// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';

void main() {
  Future<TextDirection?> directionInRtl(
    WidgetTester tester,
    TbTextField field,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: ReactiveForm(
              formGroup: FormGroup({'value': FormControl<String>()}),
              child: field,
            ),
          ),
        ),
      ),
    );
    return Directionality.of(tester.element(find.byType(EditableText)));
  }

  testWidgets(
    'emails, passwords and codes read left to right in an RTL language',
    (tester) async {
      for (final field in [
        const TbTextField(
          formControlName: 'value',
          autoFillHints: [AutofillHints.email],
        ),
        const TbTextField(formControlName: 'value', obscureText: true),
        const TbTextField(formControlName: 'value', type: TextInputType.number),
        const TbTextField(
          formControlName: 'value',
          autoFillHints: [AutofillHints.oneTimeCode],
        ),
      ]) {
        expect(await directionInRtl(tester, field), TextDirection.ltr);
      }
    },
  );

  testWidgets('names follow the language', (tester) async {
    expect(
      await directionInRtl(
        tester,
        const TbTextField(
          formControlName: 'value',
          autoFillHints: [AutofillHints.givenName],
        ),
      ),
      isNot(TextDirection.ltr),
    );
  });

  testWidgets('an LTR field in an RTL language starts at its left edge', (
    tester,
  ) async {
    await directionInRtl(
      tester,
      const TbTextField(
        formControlName: 'value',
        autoFillHints: [AutofillHints.email],
      ),
    );
    final field = tester.getRect(find.byType(TbTextField));
    final text = tester.getRect(find.byType(EditableText));
    expect(text.left - field.left, lessThan(24));
  });
}
