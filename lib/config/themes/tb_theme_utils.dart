import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

abstract class TbThemeUtils {

  static final _tbTypography = Typography.material2018();

  static final Color _tbTextColor = Color(0xFF282828);

  static final tbPrimary = _mergeColors(Colors.teal, {
    '500': Colors.teal[800]!.value
  });
  static final tbAccent = _mergeColors(Colors.deepOrange, {});

  static ThemeData createTheme(PaletteSettings? paletteSettings) {
    var primarySwatch = _materialColorFromPalette(paletteSettings?.primaryPalette, true);
    var accentColor = _materialColorFromPalette(paletteSettings?.accentPalette, false);
    var primaryColor = primarySwatch[500]!;
    return ThemeData(
        primarySwatch: primarySwatch,
        accentColor: accentColor,
        scaffoldBackgroundColor: Color(0xFFFAFAFA),
        textTheme: _tbTypography.black,
        primaryTextTheme: _tbTypography.black,
        typography: _tbTypography,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: _tbTextColor,
            /* titleTextStyle: TextStyle(
          color: _tbTextColor
      ),
      toolbarTextStyle: TextStyle(
            color: _tbTextColor
      ), */
            iconTheme: IconThemeData(
                color: _tbTextColor
            )

        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: primaryColor,
            unselectedItemColor: primaryColor.withAlpha((255 * 0.38).ceil()),
            showSelectedLabels: true,
            showUnselectedLabels: true
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeOpenPageTransitionsBuilder(),
          TargetPlatform.android: FadeOpenPageTransitionsBuilder(),
        })
    );
  }

  static MaterialColor _materialColorFromPalette(Palette? palette, bool primary) {
    if (palette == null) {
      return primary ? tbPrimary : tbAccent;
    }
    if (palette.type == 'custom') {
      var extendsColor = _colorFromType(palette.extendsPalette!);
      return _mergeColors(extendsColor, palette.colors);
    } else {
      return _colorFromType(palette.type);
    }
  }

  static MaterialColor _colorFromType(String? type) {
    switch(type) {
      case 'red':
        return Colors.red;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'deep-purple':
        return Colors.deepPurple;
      case 'indigo':
        return Colors.indigo;
      case 'blue':
        return Colors.blue;
      case 'light-blue':
        return Colors.lightBlue;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;
      case 'green':
        return Colors.green;
      case 'light-green':
        return Colors.lightGreen;
      case 'lime':
        return Colors.lime;
      case 'yellow':
        return Colors.yellow;
      case 'amber':
        return Colors.amber;
      case 'orange':
        return Colors.orange;
      case 'deep-orange':
        return Colors.deepOrange;
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'blue-grey':
        return Colors.blueGrey;
      default:
        return tbPrimary;
    }
  }

  static MaterialColor _mergeColors(MaterialColor color, Map<String,dynamic>? colors) {
    if (colors != null) {
      var swatch = <int, Color>{
        50: _parseColor(colors['50'], color[50]!),
        100:  _parseColor(colors['100'], color[100]!),
        200:  _parseColor(colors['200'], color[200]!),
        300:  _parseColor(colors['300'], color[300]!),
        400:  _parseColor(colors['400'], color[400]!),
        500:  _parseColor(colors['500'], color[500]!),
        600:  _parseColor(colors['600'], color[600]!),
        700:  _parseColor(colors['700'], color[700]!),
        800:  _parseColor(colors['800'], color[800]!),
        900:  _parseColor(colors['900'], color[900]!),
      };
      return MaterialColor(swatch[500]!.value, swatch);
    } else {
      return color;
    }
  }

  static Color _parseColor(dynamic rawColor, Color defaultColor) {
    int? intColor;
    if (rawColor != null) {
      if (rawColor is String && rawColor.isNotEmpty) {
        if (rawColor.startsWith('#')) {
          rawColor = rawColor.replaceFirst('#', '0xFF');
        }
        intColor = int.parse(rawColor);
      } else if (rawColor is int) {
        intColor = rawColor;
      }
    }
    if (intColor != null) {
      return Color(intColor);
    }
    return defaultColor;
  }

}
