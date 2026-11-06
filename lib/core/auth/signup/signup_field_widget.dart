// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_client/thingsboard_client.dart'
    show SignUpField, SignUpFieldId;

class SingUpFieldWidget extends StatelessWidget {
  const SingUpFieldWidget({
    required this.field,
    this.suffixIcon,
    this.obscureText = false,
    super.key,
  });

  final SignUpField field;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    if (field.id == SignUpFieldId.unknownDefaultOpenApi) {
      return const SizedBox.shrink();
    }

    return TbTextField(
      autoFillHints: getHintsFromId(),
      obscureText: obscureText,
      formControlName: field.id.name,
      type: keyboardTypeFromId(),
      suffixIcon: suffixIcon,
      // validator: validator(context),
      label: labelText(context),
      hint: labelText(context),
    );
  }

  List<String>? getHintsFromId() {
    switch (field.id) {
      case SignUpFieldId.EMAIL:
        return [AutofillHints.email];
      case SignUpFieldId.FIRST_NAME:
        return [AutofillHints.givenName];
      case SignUpFieldId.LAST_NAME:
        return [AutofillHints.familyName];
      case SignUpFieldId.PHONE:
        return [AutofillHints.telephoneNumber];
      case SignUpFieldId.ADDRESS:
        return [AutofillHints.streetAddressLine1];
      case SignUpFieldId.ADDRESS2:
        return [AutofillHints.streetAddressLine2];
      case SignUpFieldId.COUNTRY:
        return [AutofillHints.countryName];
      case SignUpFieldId.CITY:
        return [AutofillHints.addressCity];
      case SignUpFieldId.STATE:
        return [AutofillHints.addressState];
      case SignUpFieldId.ZIP:
        return [AutofillHints.postalCode];
      case SignUpFieldId.REPEAT_PASSWORD:
      case SignUpFieldId.PASSWORD:
        return [AutofillHints.newPassword, AutofillHints.password];
      default:
        return null;
    }
  }

  TextInputType? keyboardTypeFromId() {
    switch (field.id) {
      case SignUpFieldId.EMAIL:
        return TextInputType.emailAddress;
      case SignUpFieldId.FIRST_NAME:
      case SignUpFieldId.LAST_NAME:
        return TextInputType.name;
      case SignUpFieldId.PHONE:
        return TextInputType.phone;
      case SignUpFieldId.ADDRESS:
        return TextInputType.streetAddress;
      case SignUpFieldId.ADDRESS2:
        return TextInputType.streetAddress;
      case SignUpFieldId.unknownDefaultOpenApi:
      case SignUpFieldId.COUNTRY:
      case SignUpFieldId.CITY:
      case SignUpFieldId.STATE:
      case SignUpFieldId.ZIP:
      case SignUpFieldId.REPEAT_PASSWORD:
      case SignUpFieldId.PASSWORD:
        return null;
    }
    return null;
  }

  String fieldIsRequiredText(BuildContext context) {
    return '${field.label} ${S.of(context).isRequiredText}';
  }

  FormFieldValidator<String>? validator(BuildContext context) {
    final validators = <FormFieldValidator>[];
    if (field.required_ ?? false) {
      validators.add(
        FormBuilderValidators.required(errorText: fieldIsRequiredText(context)),
      );
    }

    return validators.isNotEmpty
        ? FormBuilderValidators.compose([
            ...validators,
            if (field.id == SignUpFieldId.EMAIL)
              FormBuilderValidators.email(
                errorText: S.of(context).emailInvalidText,
              ),
          ])
        : null;
  }

  String labelText(BuildContext context) {
    return field.label;
  }
}
