// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Text styles aligned with Figma design system
/// Using Roboto font family with consistent weights and spacing
abstract final class TbTextStyles {
  // Title Styles - for headings and important text
  static const titleLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 1.28, // 36px line height
    letterSpacing: 0.25,
  );

  static const titleMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.33, // 32px line height
    letterSpacing: 0,
  );

  static const titleSmall = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.2, // 24px line height
    letterSpacing: 0.01,
  );

  static const titleXs = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 1.33, // 24px line height
    letterSpacing: 0.15,
  );

  // Body Styles - for main content text
  static const bodyLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5, // 24px line height
    letterSpacing: 0.15,
  );

  static const bodyMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.43, // 20px line height
    letterSpacing: 0.2,
  );

  static const bodySmall = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.33, // 16px line height
    letterSpacing: 0.4,
  );

  static const bodyRegular = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 1.5, // 25.5px line height
    letterSpacing: -0.41,
  );

  // Label Styles - for buttons, form labels, and UI elements
  static const labelLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.5, // 24px line height
    letterSpacing: 0.25,
  );

  static const labelMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.43, // 20px line height
    letterSpacing: 0.25,
  );

  static const labelSmall = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.33, // 16px line height
    letterSpacing: 0.4,
  );

  // Additional styles for specific use cases
  static const titleSmallSb = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.2, // 24px line height
    letterSpacing: 0.01,
  );

  // Caption style for very small text
  static const caption = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 1.45, // 16px line height
    letterSpacing: 0.25,
  );

  // Button text style
  static const button = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.43, // 20px line height
    letterSpacing: 0.25,
  );
}
