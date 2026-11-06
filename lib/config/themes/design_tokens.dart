// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Design tokens for consistent spacing, sizing, and styling
/// Based on Figma design system specifications
class DesignTokens {
  DesignTokens._();

  // Spacing tokens
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;

  // Border radius tokens
  static const double radiusSmall = 4.0;

  // Elevation tokens
  static const double elevationMedium = 2.0;

  // Icon sizes
  static const double iconMedium = 24.0;

  // Button heights
  static const double buttonHeightSmall = 32.0;
  static const double buttonHeightMedium = 40.0;

  // Common edge insets
  static const EdgeInsets paddingSmall = EdgeInsets.all(spacing8);
  static const EdgeInsets paddingMedium = EdgeInsets.all(spacing16);
  static const EdgeInsets paddigZero = EdgeInsets.zero;
  // Button padding
  static const EdgeInsets buttonPaddingMedium = EdgeInsets.symmetric(
    horizontal: spacing16,
    vertical: spacing12,
  );

  // Common border radius
  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(radiusSmall);
}
