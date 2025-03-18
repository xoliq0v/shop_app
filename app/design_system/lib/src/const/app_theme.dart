import '../../design_system.dart';
import '../widget/google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


abstract class ThemeConfig {
  static ThemeData get light {
    ColorScheme colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      secondary: AppColors.main,
      error: Colors.red,
      surface: AppColors.alpineGoat,
      onPrimary: Colors.purple,
      onSecondary: AppColors.mintZest,
      onError: Colors.redAccent,
      onSurface: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: AppColors.blackWash,
          fontWeight: FontWeight.w700
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
      ),
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 40,
          color: AppColors.main,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
          letterSpacing: -0.17,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.greatFalls,
        ),
      ),
    );
  }

  static ThemeData get dark {
    ColorScheme colorScheme = const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      secondary: AppColors.glen,
      error: Colors.red,
      surface: AppColors.coalmine,
      onPrimary: AppColors.main,
      onSecondary: AppColors.dynamicBlack,
      onError: Colors.red,
      onSurface: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black,
        titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
      ),
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 40,
          color: AppColors.main,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
          letterSpacing: -0.17,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.greatFalls,
        ),
      )
    );
  }
}