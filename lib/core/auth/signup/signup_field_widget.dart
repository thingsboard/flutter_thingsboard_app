import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show SignUpField, SignUpFieldsId, SignUpFieldsIdToString;

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
    if (field.id == SignUpFieldsId.undefined) {
      return const SizedBox.shrink();
    }

    return FormBuilderTextField(
      obscureText: obscureText,
      name: field.id.toShortString(),
      keyboardType: keyboardTypeFromId(),
      validator: validator(context),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        border: const OutlineInputBorder(),
        labelText: labelText(context),
        suffixIcon: suffixIcon,
      ),
    );
  }

  TextInputType? keyboardTypeFromId() {
    switch (field.id) {
      case SignUpFieldsId.email:
        return TextInputType.emailAddress;
      case SignUpFieldsId.first_name:
      case SignUpFieldsId.last_name:
        return TextInputType.name;
      case SignUpFieldsId.phone:
        return TextInputType.phone;
      case SignUpFieldsId.address:
        return TextInputType.streetAddress;
      case SignUpFieldsId.address2:
        return TextInputType.streetAddress;
      case SignUpFieldsId.undefined:
      case SignUpFieldsId.country:
      case SignUpFieldsId.city:
      case SignUpFieldsId.state:
      case SignUpFieldsId.zip:
      case SignUpFieldsId.repeat_password:
      case SignUpFieldsId.password:
        return null;
    }
  }

  String fieldIsRequiredText(BuildContext context) {
    return '${field.label} ${S.of(context).isRequiredText}';
  }

  dynamic validator(BuildContext context) {
    final validators = <FormFieldValidator>[];
    if (field.required) {
      validators.add(
        FormBuilderValidators.required(
          errorText: fieldIsRequiredText(context),
        ),
      );
    }

    return validators.isNotEmpty
        ? FormBuilderValidators.compose([
            ...validators,
            if (field.id == SignUpFieldsId.email)
              FormBuilderValidators.email(
                errorText: S.of(context).emailInvalidText,
              ),
          ])
        : null;
  }

  String labelText(BuildContext context) {
    return field.required ? '${field.label} *' : field.label;
  }
}
