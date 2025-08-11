import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

const int _tbPrimaryColorValue = 0xFF305680;
const Color _tbPrimaryColor = Color(_tbPrimaryColorValue);
const Color _tbSecondaryColor = Color(0xFF527dad);
const Color _tbDarkPrimaryColor = Color(0xFF9fa8da);
Color get appPrimaryColor => _tbPrimaryColor;
const int _tbTextColorValue = 0xFF282828;
const Color _tbTextColor = Color(_tbTextColorValue);

Typography tbTypography = Typography.material2018();

const tbMatIndigo = MaterialColor(_tbPrimaryColorValue, <int, Color>{
  50: Color(0xFFE8EAF6),
  100: Color(0xFFC5CAE9),
  200: Color(0xFF9FA8DA),
  300: Color(0xFF7986CB),
  400: Color(0xFF5C6BC0),
  500: _tbPrimaryColor,
  600: _tbSecondaryColor,
  700: Color(0xFF303F9F),
  800: Color(0xFF283593),
  900: Color(0xFF1A237E),
});

const tbDarkMatIndigo = MaterialColor(_tbPrimaryColorValue, <int, Color>{
  50: Color(0xFFE8EAF6),
  100: Color(0xFFC5CAE9),
  200: Color(0xFF9FA8DA),
  300: Color(0xFF7986CB),
  400: Color(0xFF5C6BC0),
  500: _tbDarkPrimaryColor,
  600: _tbSecondaryColor,
  700: Color(0xFF303F9F),
  800: _tbPrimaryColor,
  900: Color(0xFF1A237E),
});

final ThemeData theme = ThemeData(primarySwatch: tbMatIndigo);

ThemeData tbTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: tbMatIndigo,
  colorScheme: theme.colorScheme.copyWith(
    primary: tbMatIndigo,
    secondary: Colors.deepOrange,
  ),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  textTheme: tbTypography.black,
  primaryTextTheme: tbTypography.black,
  typography: tbTypography,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: _tbTextColor,
    iconTheme: IconThemeData(color: _tbTextColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: _tbPrimaryColor,
    unselectedItemColor: Colors.black.withValues(alpha: .38),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeOpenPageTransitionsBuilder(),
      TargetPlatform.android: FadeOpenPageTransitionsBuilder(),
    },
  ),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: tbDarkMatIndigo,
  brightness: Brightness.dark,
);

ThemeData tbDarkTheme = ThemeData(
  primarySwatch: tbDarkMatIndigo,
  colorScheme: darkTheme.colorScheme.copyWith(secondary: Colors.deepOrange),
  brightness: Brightness.dark,
);
