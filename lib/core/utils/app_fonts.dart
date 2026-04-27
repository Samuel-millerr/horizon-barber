import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle mainFont({
    double size = 20,
    Color color = Colors.black,
    FontWeight weight = FontWeight.w500,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }

  static TextStyle bodyFont({
    double size = 20,
    Color color = Colors.black,
    FontWeight weight = FontWeight.w500,
  }) {
    return GoogleFonts.barlow(fontSize: size, color: color, fontWeight: weight);
  }

  static TextStyle condFont({
    double size = 20,
    Color color = Colors.black,
    FontWeight weight = FontWeight.w500,
  }) {
    return GoogleFonts.barlowCondensed(
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }
}
