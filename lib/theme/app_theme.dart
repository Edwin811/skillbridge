import 'package:flutter/material.dart';

class AppColors {
  // Brand Color Palette from user reference image:
  static const Color tealDeep = Color(0xFF0E6973);     // #0E6973 Deep Pine Teal
  static const Color tealMedium = Color(0xFF118C8C);   // #118C8C Medium Ocean Teal
  static const Color mintSoft = Color(0xFFBAD9CE);     // #BAD9CE Soft Mint Aqua
  static const Color yellowCitrus = Color(0xFFF2BB16); // #F2BB16 Citrus Yellow Gold
  static const Color ochreAmber = Color(0xFFBF820F);   // #BF820F Warm Ochre Amber

  // Neutrals and Accents
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF7FAF9);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF11282C);
  static const Color textSecondary = Color(0xFF567276);
  static const Color textMuted = Color(0xFF849FA2);
  static const Color border = Color(0xFFDCE8E5);
  static const Color mintSubtle = Color(0xFFE6F3F0);
  static const Color success = Color(0xFF10B981);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.tealDeep,
        primary: AppColors.tealDeep,
        secondary: AppColors.tealMedium,
        tertiary: AppColors.yellowCitrus,
        surface: AppColors.surface,
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.tealDeep,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBg,
        elevation: 2,
        shadowColor: AppColors.tealDeep.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellowCitrus,
          foregroundColor: const Color(0xFF09474E),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
