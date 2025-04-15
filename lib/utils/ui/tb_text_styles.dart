import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class TbTextStyles {
  static final titleXs = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 1.33,
    letterSpacing: .15,
  );

  static final titleSmallSb = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    letterSpacing: .01,
    height: 1.2,
  );

  static final titleMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.33,
  );

  static final titleLarge = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 1.28,
    letterSpacing: .25,
  );

  static final labelSmall = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.14,
    letterSpacing: .4,
  );

  static final labelMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: .25,
    height: 1.4,
  );

  static final labelLarge = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: .25,
    height: 1.5,
  );

  static final bodySmall = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 1.45,
    letterSpacing: .25,
  );

  static final bodyMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: .2,
    height: 1.4,
  );

  static final bodyRegular = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 1.5,
    letterSpacing: -0.41,
  );

  static final bodyLarge = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: .15,
    height: 1.5,
  );
}
