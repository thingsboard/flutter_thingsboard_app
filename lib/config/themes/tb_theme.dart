import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/design_tokens.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

Typography tbTypography = Typography.material2018();

ThemeData  tbTheme(MaterialColor primarySwatch, Color primaryColor, Color accentColor) {
  final ThemeData theme = ThemeData(primarySwatch: primarySwatch);
  return ThemeData(
  useMaterial3: false,
  primarySwatch: primarySwatch,
  colorScheme: theme.colorScheme.copyWith(
    primary: primaryColor,
    secondary: accentColor,
  ),
  inputDecorationTheme: inputTheme(primaryColor),
  textSelectionTheme: textSelectionTheme(primaryColor),
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  textTheme: tbTypography.black,
  primaryTextTheme: tbTypography.black,
  typography: tbTypography,
  appBarTheme: appBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme(primaryColor),
  cardTheme: cardTheme,
  dividerTheme: dividerTheme,
  textButtonTheme: textButtonTheme(primaryColor),
  outlinedButtonTheme: outlinedButtonTheme(primaryColor),
  filledButtonTheme: filledButtonTheme(primaryColor),
  elevatedButtonTheme: elevatedButtonTheme(primaryColor),
  iconTheme: iconTheme,
  listTileTheme: listTitleTheme,
  pageTransitionsTheme: pageTransitionsTheme,
   progressIndicatorTheme: ProgressIndicatorThemeData(
      color: accentColor, 
    ),
    indicatorColor: accentColor
);
}

PageTransitionsTheme pageTransitionsTheme = 
   const PageTransitionsTheme(
  builders: {
    TargetPlatform.iOS: FadeOpenPageTransitionsBuilder(),
    TargetPlatform.android: FadeOpenPageTransitionsBuilder(),
  },
);

ListTileThemeData listTitleTheme = 
   const ListTileThemeData(
    dense: true,
  contentPadding: DesignTokens.paddingMedium,
  minVerticalPadding: 0,
  minTileHeight: 8,
  iconColor: AppColors.iconSecondary,
  
  textColor: AppColors.textPrimary,
);


IconThemeData iconTheme= 
   const IconThemeData(
  color: AppColors.iconSecondary,
  size: DesignTokens.iconMedium,
);


ElevatedButtonThemeData elevatedButtonTheme(Color primaryColor) => 
   ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: AppColors.white,
    padding: DesignTokens.buttonPaddingMedium,
    textStyle: TbTextStyles.button,
    elevation: DesignTokens.elevationMedium,
    shadowColor: AppColors.black.withValues(alpha: 0.15),
    shape: RoundedRectangleBorder(
      borderRadius: DesignTokens.borderRadiusSmall,
    ),
    minimumSize: const Size(0, DesignTokens.buttonHeightMedium),
  ),
);


FilledButtonThemeData filledButtonTheme(Color primaryColor) =>
   FilledButtonThemeData(
  style: FilledButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: AppColors.white,
    padding: DesignTokens.buttonPaddingMedium,
    textStyle: TbTextStyles.button,
    shape: RoundedRectangleBorder(
      borderRadius: DesignTokens.borderRadiusSmall,
    ),
    minimumSize: const Size(0, DesignTokens.buttonHeightMedium),
  ),
);


OutlinedButtonThemeData outlinedButtonTheme(Color primaryColor) =>
   OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: AppColors.bordersLight),
    padding: DesignTokens.buttonPaddingMedium,
    textStyle: TbTextStyles.button,
    shape: RoundedRectangleBorder(
      borderRadius: DesignTokens.borderRadiusSmall,
    ),
    minimumSize: const Size(0, DesignTokens.buttonHeightMedium),
  ),
);


TextButtonThemeData textButtonTheme(Color primaryColor) =>
   TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: primaryColor,
    padding: DesignTokens.buttonPaddingMedium,
    textStyle: TbTextStyles.button,
    shape: RoundedRectangleBorder(
      borderRadius: DesignTokens.borderRadiusSmall,
    ),
    minimumSize: const Size(0, DesignTokens.buttonHeightMedium),
  ),
);


DividerThemeData dividerTheme = 
   const DividerThemeData(
  color: AppColors.bordersLight,
  thickness: 1,
  space: 1,
);


CardThemeData cardTheme = 
   CardThemeData(
  color: AppColors.white,
  shadowColor: AppColors.black.withValues(alpha: 0.1),
  elevation: DesignTokens.elevationMedium,
  shape: RoundedRectangleBorder(
    borderRadius: DesignTokens.borderRadiusSmall,
  ),
  margin: DesignTokens.paddingSmall,
);


BottomNavigationBarThemeData bottomNavigationBarTheme(Color primaryColor) =>
    BottomNavigationBarThemeData(
  backgroundColor: AppColors.white,
  selectedItemColor: primaryColor,
  unselectedItemColor: AppColors.textTertiary,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
);


AppBarTheme appBarTheme =
    AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
  backgroundColor: AppColors.white,
  foregroundColor: AppColors.textPrimary,
  iconTheme: const IconThemeData(color: AppColors.iconSecondary),
  elevation: 0,
  titleTextStyle: TbTextStyles.titleXs.copyWith(
            color: AppColors.textPrimary,
          ),
  centerTitle: false,
);


TextSelectionThemeData textSelectionTheme(Color primaryColor) =>
    TextSelectionThemeData(
  cursorColor: primaryColor,
  selectionHandleColor: primaryColor,
  selectionColor: AppColors.selectionColor,
);


 InputDecorationTheme inputTheme(Color primaryColor) =>
   InputDecorationTheme(
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
        ? primaryColor
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
    borderSide:  BorderSide(color: primaryColor, width: 2),
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
  focusColor: AppColors.focusColor,
);

