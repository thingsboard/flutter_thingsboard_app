import 'package:flutter/widgets.dart';

typedef ProviderDescFunction =
    String Function(BuildContext context, String? contact);
typedef TextFunction = String Function(BuildContext context);

class TwoFactorAuthProviderLoginData {
  TwoFactorAuthProviderLoginData({
    required this.codeLength,
    required this.textInputType,
    required this.setupSuccessDescription,
    required this.nameFunction,
    required this.descFunction,
    required this.placeholderFunction,
    required this.icon,
  });
  TextFunction nameFunction;
  ProviderDescFunction descFunction;
  TextFunction placeholderFunction;
  String icon;
  final TextFunction setupSuccessDescription;
  final int codeLength;
  final TextInputType textInputType;
}
