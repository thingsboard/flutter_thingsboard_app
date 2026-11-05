import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

abstract class TbThemeUtils {
  //static final _tbTypography = Typography.material2018();

  // static const Color _tbTextColor = Color(0xFF282828);

  static final tbPrimary =
  // ignore: deprecated_member_use
  _mergeColors(Colors.teal, {'500': Colors.teal[800]!.value});
  static final tbAccent = _mergeColors(Colors.deepOrange, {});
  static final tbPrimaryColor = tbPrimary[500]!;
  static final tbAccentColor = tbAccent[500]!;
  static ThemeData createTheme(PaletteSettings? paletteSettings) {
    final primarySwatch = materialColorFromPalette(
      paletteSettings?.primaryPalette,
      true,
    );
    final accentColor = materialColorFromPalette(
      paletteSettings?.accentPalette,
      false,
    );
    final primaryColor = primarySwatch[500]!;
    final accent = accentColor[500]!;
    return tbTheme(primarySwatch, primaryColor, accent);
  }

  static MaterialColor materialColorFromPalette(
    Palette? palette,
    bool primary,
  ) {
    if (palette == null) {
      return primary ? tbPrimary : tbAccent;
    }
    if (palette.type == 'custom') {
      final extendsColor = _colorFromType(palette.extends_);
      return _mergeColors(
        extendsColor,
        palette.colors?.toMap().cast<String, dynamic>(),
      );
    } else {
      return _colorFromType(palette.type);
    }
  }

  static MaterialColor _colorFromType(String? type) {
    switch (type) {
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
      case 'tb-accent':
        return tbAccent;
      default:
        return tbPrimary;
    }
  }

  static MaterialColor _mergeColors(
    MaterialColor color,
    Map<String, dynamic>? colors,
  ) {
    if (colors != null) {
      final swatch = <int, Color>{
        50: _parseColor(colors['50'], color[50]!),
        100: _parseColor(colors['100'], color[100]!),
        200: _parseColor(colors['200'], color[200]!),
        300: _parseColor(colors['300'], color[300]!),
        400: _parseColor(colors['400'], color[400]!),
        500: _parseColor(colors['500'], color[500]!),
        600: _parseColor(colors['600'], color[600]!),
        700: _parseColor(colors['700'], color[700]!),
        800: _parseColor(colors['800'], color[800]!),
        900: _parseColor(colors['900'], color[900]!),
      };
      // ignore: deprecated_member_use
      return MaterialColor(swatch[500]!.value, swatch);
    } else {
      return color;
    }
  }

  static Color _parseColor(dynamic rawColor, Color defaultColor) {
    int? intColor;
    if (rawColor != null) {
      if (rawColor is String && rawColor.isNotEmpty) {
        String stringColor = rawColor;
        if (rawColor.startsWith('#')) {
          stringColor = rawColor.replaceFirst('#', '0xFF');
        }
        intColor = int.parse(stringColor);
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
