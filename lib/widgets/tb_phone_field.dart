// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/generated/l10n.dart';

/// The phone number field of the form control `phone`; the country is picked
/// separately, so only its dial code shows.
class TbPhoneField extends StatelessWidget {
  const TbPhoneField({required this.controller, this.border, super.key});

  final PhoneController controller;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    // A phone number reads left to right in every language; in Arabic the
    // field would otherwise reorder its digits and brackets.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ReactivePhoneFormField<PhoneNumber>(
        controller: controller,
        countryButtonStyle: const CountryButtonStyle(
          textStyle: TbTextStyles.bodyLarge,
          showFlag: false,
          showDropdownIcon: false,
        ),
        style: TbTextStyles.bodyLarge,
        decoration: InputDecoration(
          hintText: S.of(context).phone,
          isDense: true,
          border: border,
          helperText: S.of(context).phoneNumberHelperText,
        ),
        formControlName: 'phone',
        valueAccessor: PhoneNumberValueAccessor(),
        // The country is picked separately, so the field takes the number
        // without its country code.
        autofillHints: const [AutofillHints.telephoneNumberNational],
        isCountryButtonPersistent: true,
        isCountrySelectionEnabled: false,
      ),
    );
  }
}
