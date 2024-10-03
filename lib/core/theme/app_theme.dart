import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final Brightness brightness;
  final Color seedColor;
  late ColorScheme colorScheme;

  AppTheme.fromBrightness({
    required this.brightness,
    required this.seedColor,
  }) {
    colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: seedColor,
    );
  }

  ThemeData toThemeData() {
    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    ).copyWith(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(
          colorScheme: colorScheme,
        ).textTheme,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            40,
          ),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: colorScheme.primary,
        suffixIconColor: colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
