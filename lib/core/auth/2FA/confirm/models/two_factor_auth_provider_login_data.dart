// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

typedef ProviderDescFunction = String Function(
  BuildContext context,
  String? contact,
);
typedef TextFunction = String Function(BuildContext context);

class TwoFactorAuthProviderLoginData {
  TwoFactorAuthProviderLoginData({
    required this.codeLength,
    required this.textInputType,
    required this.setupSuccessDescription,
    required this.nameFunction,
    required this.setupTitleFunction,
    required this.setupDescriptionFunction,
    required this.descFunction,
    required this.placeholderFunction,
    required this.icon,
  });
  TextFunction nameFunction;
  final TextFunction setupTitleFunction;
  final TextFunction setupDescriptionFunction;
  ProviderDescFunction descFunction;
  TextFunction placeholderFunction;
  String icon;
  final TextFunction setupSuccessDescription;
  final int codeLength;
  final TextInputType textInputType;
}
