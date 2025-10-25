import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'font_utils.dart';

class ThemeUtils {
  static ThemeData buildTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      fontFamily: FontUtils.getFontFamily(context),
      textTheme: TextTheme(
        displayLarge: FontUtils.heading1(context),
        displayMedium: FontUtils.heading2(context),
        displaySmall: FontUtils.heading3(context),
        bodyLarge: FontUtils.body(context),
        bodyMedium: FontUtils.bodySmall(context),
        labelLarge: FontUtils.button(context),
      ),
    );
  }

  static ThemeData buildThemeForLocale(Locale locale) {
    // Create a simple theme without context dependency
    final fontFamily = locale.languageCode == 'ar' ? 'Cairo' : 'Poppins';

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      fontFamily: fontFamily,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
