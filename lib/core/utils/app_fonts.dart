import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle mainFontMedium({
    double size = 20,
    Color color = Colors.black,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle mainFontBold({
    double size = 20,
    Color color = Colors.black,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bodyFontMedium({
    double size = 20,
    Color color = Colors.black,
  }) {
    return GoogleFonts.barlow(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle condFontMedium({
    double size = 20,
    Color color = Colors.black,
  }) {
    return GoogleFonts.barlowCondensed(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}
