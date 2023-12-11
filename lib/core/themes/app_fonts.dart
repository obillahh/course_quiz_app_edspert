import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextTheme appFont = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 24,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
    ),
  );
}
