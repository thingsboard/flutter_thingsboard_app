import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  
  // Primary Brand Colors (CE Blue Theme)
  static const primaryBlue = Color(0xFF305680);
  static const secondaryBlue = Color(0xFF527dad);
  static const darkPrimaryBlue = Color(0xFF9fa8da);
  
  // Surface Colors
  static const white = Color(0xFFFFFFFF);
  static const scaffoldBackground = Color(0xFFFAFAFA);
  static const surfaceLight = Color(0xFFF4F6F8);
  static const black = Color(0xFF000000);
  
  // Text Colors
  static const textPrimary = Color(0xDE000000);
  static const textSecondary = Color(0xC2000000);
  static const textTertiary = Color(0x8A000000);
  static const textDisabled = Color(0x61000000);
  static const textWhite = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF282828);
  
  // Icon Colors
  static const iconSecondary = Color(0xC2000000);
  static const iconTertiary = Color(0x8a000000);
  static const iconDisabled = Color(0x61000000);
  
  // Border Colors
  static const bordersLight = Color(0x1F000000);
  static const borderError = Color(0xFFD12730);
  
  // State Colors
  static const textError = Color(0xFFD12730);
  static const notificationInfo = Color(0xFF323232);
  static const notificationWarning = Color(0xFFdc6d1b);
  static const notificationSuccess = Color(0xFF008000);
  static const notificationError = Color(0xFFD12730);
  
  // Overlay Colors
  static const bgOverlay = Color(0x61000000);
  static const cameraBackground = Color(0xFF828282);
  
  // Selection and Focus Colors
  static const selectionColor = Color(0x33305680); // primaryBlue with 20% opacity
  static const focusColor = primaryBlue;
  
  // Material Color Swatch for Primary Blue
  static const MaterialColor primarySwatch = MaterialColor(0xFF305680, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: primaryBlue,
    600: secondaryBlue,
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  });
  
  // Dark Theme Material Color Swatch
  static const MaterialColor darkPrimarySwatch = MaterialColor(0xFF305680, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: darkPrimaryBlue,
    600: secondaryBlue,
    700: Color(0xFF303F9F),
    800: primaryBlue,
    900: Color(0xFF1A237E),
  });
  
  // Getters for dynamic color access
  static Color get appPrimaryColor => primaryBlue;
}
