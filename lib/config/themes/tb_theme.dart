import 'package:flutter/material.dart';

const int _tbPrimaryColor = 0xFF305680;
const int _tbSecondaryColor = 0xFF527dad;
const int _tbDarkPrimaryColor = 0xFF9fa8da;

const tbMatIndigo = MaterialColor(
  _tbPrimaryColor,
  <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(_tbPrimaryColor),
    600: Color(_tbSecondaryColor),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  },);

const tbDarkMatIndigo = MaterialColor(
  _tbPrimaryColor,
  <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(_tbDarkPrimaryColor),
    600: Color(_tbSecondaryColor),
    700: Color(0xFF303F9F),
    800: Color(_tbPrimaryColor),
    900: Color(0xFF1A237E),
  },);

ThemeData tbTheme = ThemeData(
    primarySwatch: tbMatIndigo,
    accentColor: Colors.deepOrange
);

ThemeData tbDarkTheme = ThemeData(
    primarySwatch: tbDarkMatIndigo,
    accentColor: Colors.deepOrange,
    brightness: Brightness.dark
);
