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
    // Phone numbers read left to right in every language (RTL guidelines);
    // the hint under the field is a sentence and keeps the app's direction.
    final direction = Directionality.of(context);
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
          helper: Directionality(
            textDirection: direction,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              // A helper widget does not get the theme's helper style.
              child: Text(
                S.of(context).phoneNumberHelperText,
                style: _helperStyle(Theme.of(context)),
              ),
            ),
          ),
        ),
        formControlName: 'phone',
        valueAccessor: PhoneNumberValueAccessor(),
        autofillHints: const [AutofillHints.telephoneNumberNational],
        isCountryButtonPersistent: true,
        isCountrySelectionEnabled: false,
      ),
    );
  }
}

TextStyle? _helperStyle(ThemeData theme) => theme.textTheme.bodySmall
    ?.copyWith(color: theme.hintColor)
    .merge(theme.inputDecorationTheme.helperStyle);
