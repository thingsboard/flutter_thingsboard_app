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
}
