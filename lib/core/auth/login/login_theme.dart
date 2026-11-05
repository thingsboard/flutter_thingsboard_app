// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

/// Mirrors the web login page: the page is painted with the primary palette,
/// the sign-in button with the accent palette, and text and icons are light
/// unless login white-labeling turns on "Dark foreground".
ThemeData loginPageTheme(ThemeData base, {required bool darkForeground}) {
  final foreground = darkForeground ? Colors.black : Colors.white;
  final primary = foreground.withValues(alpha: 0.87);
  final secondary = foreground.withValues(alpha: 0.7);
  final border = foreground.withValues(alpha: 0.38);
  final error = _readableOn(
    base.primaryColor,
    AppColors.textError,
    lighten: !darkForeground,
  );
  final accent = base.colorScheme.secondary;
  final onAccent =
      ThemeData.estimateBrightnessForColor(accent) == Brightness.dark
          ? Colors.white
          : Colors.black87;

  return base.copyWith(
    scaffoldBackgroundColor: base.primaryColor,
    colorScheme: base.colorScheme.copyWith(
      primary: primary,
      onSurface: primary,
    ),
    textTheme: base.textTheme.apply(bodyColor: primary, displayColor: primary),
    iconTheme: base.iconTheme.copyWith(color: secondary),
    dividerTheme: base.dividerTheme.copyWith(color: border),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: foreground.withValues(alpha: 0.3),
      selectionHandleColor: primary,
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      labelStyle: TbTextStyles.bodyLarge.copyWith(color: secondary),
      floatingLabelStyle: TbTextStyles.labelSmall.copyWith(color: secondary),
      hintStyle: TbTextStyles.bodyLarge.copyWith(color: secondary),
      prefixIconColor: secondary,
      suffixIconColor: secondary,
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: border)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary, width: 2),
      ),
      errorStyle: base.inputDecorationTheme.errorStyle?.copyWith(color: error),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: error)),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: error),
      ),
    ),
    // styleFrom() leaves the disabled state to the Material defaults, so a
    // disabled sign-in button still looks disabled; the base style fills in
    // shape, padding and the rest.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: onAccent,
      ).merge(base.elevatedButtonTheme.style),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
      ).merge(base.textButtonTheme.style),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: BorderSide(color: border),
      ).merge(base.outlinedButtonTheme.style),
    ),
  );
}

/// Moves the lightness of [color] towards the foreground until it reaches a
/// 4:1 contrast on [background], so it stays readable on any palette while
/// keeping its hue. 4:1 rather than AA's 4.5:1: on saturated dark palettes
/// AA turns the red almost white, and the error stops reading as one.
/// Lightness stays within 0.1–0.9 so the color never becomes plain white or
/// black text, even where 4:1 is unreachable.
Color _readableOn(Color background, Color color, {required bool lighten}) {
  const minLightness = 0.1;
  const maxLightness = 0.9;
  final bgLuminance = background.computeLuminance();
  double contrast(Color c) {
    final l = c.computeLuminance();
    return (max(l, bgLuminance) + 0.05) / (min(l, bgLuminance) + 0.05);
  }

  var hsl = HSLColor.fromColor(color);
  while (contrast(hsl.toColor()) < 4 &&
      (lighten ? hsl.lightness < maxLightness : hsl.lightness > minLightness)) {
    hsl = hsl.withLightness(
      (hsl.lightness + (lighten ? 0.01 : -0.01)).clamp(
        minLightness,
        maxLightness,
      ),
    );
  }
  return hsl.toColor();
}
