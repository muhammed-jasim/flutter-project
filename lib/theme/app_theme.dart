
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  // Colors
  static const Color primaryBlue = Color(0xFF2962FF); // Vivid Blue
  static const Color secondaryBlue = Color(0xFF448AFF);
  static const Color accentColor = Color(0xFF00B0FF);
  
  static const Color backgroundLight = Color(0xFFF5F7FA); // Light Greyish Blue
  static const Color surfaceWhite = Colors.white;
  
  static const Color textDark = Color(0xFF1A1F36); // Dark Navy/Black for headings
  static const Color textGrey = Color(0xFF6B7280); // Cool Grey for body

  static const Color successGreen = Color(0xFF00C853);
  static const Color errorRed = Color(0xFFD50000);
  static const Color warningOrange = Color(0xFFFFAB00);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2962FF), Color(0xFF448AFF)], // Blue to lighter blue
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFF5F7FA), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Text Styles
  static TextStyle get headlineLarge => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textDark,
    height: 1.2,
  );

  static TextStyle get headlineMedium => GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textDark,
  );

  static TextStyle get titleLarge => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textDark,
  );
  
  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textGrey,
  );

  static TextStyle get labelSmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textGrey,
    letterSpacing: 0.5,
  );

  // Box Decorations
  static BoxDecoration cardDecoration = BoxDecoration(
    color: surfaceWhite,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04), // Very subtle shadow
        blurRadius: 16,
        offset: const Offset(0, 8),
      ),
    ],
  );

   static BoxDecoration primaryCardDecoration = BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        color: primaryBlue.withOpacity(0.3),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        background: backgroundLight,
        surface: surfaceWhite,
        primary: primaryBlue,
        secondary: secondaryBlue,
      ),
      textTheme: TextTheme(
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        titleLarge: titleLarge,
        bodyMedium: bodyMedium,
        labelSmall: labelSmall,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundLight, // Transparent/Blend
        elevation: 0,
        centerTitle: false,
        titleTextStyle: headlineMedium.copyWith(color: textDark),
        iconTheme: const IconThemeData(color: textDark),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceWhite,
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        elevation: 0, 
        // We might want a custom container for shadow
      ),
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0, // Flat style
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceWhite,
        elevation: 0, // Using manual shadows
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.zero,
      ),
    );
  }
}
