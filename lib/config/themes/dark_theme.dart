
import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

final ThemeData darkTheme = ThemeData(
  primarySwatch: AppColors.darkPrimarySwatch,
  brightness: Brightness.dark,
);

ThemeData tbDarkTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: AppColors.darkPrimarySwatch,
  brightness: Brightness.dark,
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: AppColors.darkPrimaryBlue,
    secondary: Colors.deepOrange,
  ),
  
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TbTextStyles.bodyLarge.copyWith(
      color: AppColors.textTertiary,
    ),
    helperStyle: TbTextStyles.labelSmall.copyWith(color: AppColors.textDisabled),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((
      Set<WidgetState> states,
    ) {
      final Color color = states.contains(WidgetState.focused)
          ? AppColors.darkPrimaryBlue
          : AppColors.textTertiary;
      return TbTextStyles.labelSmall.copyWith(color: color);
    }),
    hintStyle: TbTextStyles.bodyLarge.copyWith(
      color: AppColors.textTertiary,
    ),
    errorStyle: TbTextStyles.labelSmall.copyWith(
      color: AppColors.textError,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.darkPrimaryBlue, width: 2),
      borderRadius: BorderRadius.circular(4),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.bordersLight),
      borderRadius: BorderRadius.circular(4),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.bordersLight),
      borderRadius: BorderRadius.circular(4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.borderError),
      borderRadius: BorderRadius.circular(4),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.borderError),
      borderRadius: BorderRadius.circular(4),
    ),
    focusColor: AppColors.darkPrimaryBlue,
  ),
  
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.darkPrimaryBlue,
    selectionHandleColor: AppColors.darkPrimaryBlue,
    selectionColor: AppColors.darkPrimaryBlue.withValues(alpha: 0.2),
  ),
  
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black,
    foregroundColor: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.white),
    elevation: 0,
    centerTitle: false,
  ),
  
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.black,
    selectedItemColor: AppColors.darkPrimaryBlue,
    unselectedItemColor: AppColors.surfaceLight,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.darkPrimaryBlue,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: TbTextStyles.labelMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.darkPrimaryBlue,
      side: const BorderSide(color: AppColors.darkPrimaryBlue),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: TbTextStyles.labelMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.darkPrimaryBlue,
      foregroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: TbTextStyles.labelMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimaryBlue,
      foregroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: TbTextStyles.labelMedium,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeOpenPageTransitionsBuilder(),
      TargetPlatform.android: FadeOpenPageTransitionsBuilder(),
    },
  ),
);
