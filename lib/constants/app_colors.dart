import 'package:flutter/material.dart';

// --- 1. Hex Color Utility ---

/// Converts a hex code string (e.g., "#493B7A") to a Flutter Color object.
Color hexToColor(String hexCode) {
  // Remove the '#' if present
  final hex = hexCode.replaceAll('#', '');

  // Parse the hex color and prepend the alpha value (FF for fully opaque)
  return Color(int.parse('FF$hex', radix: 16));
}

// --- 2. Color Constants (Based on Theme Guide) ---

class AppColors {
  // Core Palette
  static final Color primaryInteraction = hexToColor('#493B7A'); // Deep Primary/Base
  static final Color surfaceBackground = hexToColor('#F5E0F2'); // Primary/Background
  static final Color baseAccentShadows = hexToColor('#E7D6F5'); // Background Gradient
  static final Color primaryText = hexToColor('#333333'); // Primary Text
  static final Color secondaryTextHint = hexToColor('#A65E9A'); // Secondary Text/Hint

  // Data & Status Colors
  static final Color dataViz1 = hexToColor('#A65E9A'); // Accent 4
  static final Color dataViz2 = hexToColor('#E0C4E7'); // Accent 1
  static final Color dataViz3 = hexToColor('#F3C7A5'); // Accent 2 (Warning)
  static final Color dataViz4 = hexToColor('#A5B8E6'); // Accent 3 (Success)
}

// --- 3. ThemeData Definition ---

class PastelDuskTheme {
  static final ThemeData light = ThemeData(
    // Global Surface/Canvas Colors
    scaffoldBackgroundColor: AppColors.surfaceBackground,
    cardColor: AppColors.surfaceBackground,
    splashFactory: InkRipple.splashFactory,

    // Primary Color (Used for buttons, switches, active states)
    primaryColor: AppColors.primaryInteraction,

    // Color Scheme for modern Material 3 properties
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryInteraction,
      surface: AppColors.surfaceBackground,
      background: AppColors.surfaceBackground,
      secondary: AppColors.secondaryTextHint, // Using secondary for lighter actions/accents
    ),

    // Typography Theme
    textTheme: TextTheme(
      // H1/Title (Screen) - Mapped to DisplayMedium
      displayMedium: TextStyle(color: AppColors.primaryInteraction, fontWeight: FontWeight.bold, fontSize: 28),
      // H2/Card Header - Mapped to TitleLarge
      titleLarge: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.w600, fontSize: 18),
      // Body Text - Mapped to BodyMedium
      bodyMedium: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.normal, fontSize: 14),
      // Metadata/Timestamp - Mapped to LabelSmall
      labelSmall: TextStyle(color: AppColors.secondaryTextHint, fontWeight: FontWeight.normal, fontSize: 12),
    ),

    // AppBar Styling
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryInteraction),
      titleTextStyle: TextStyle(color: AppColors.primaryInteraction, fontSize: 20, fontWeight: FontWeight.bold),
    ),

    // Card Styling
    cardTheme: CardThemeData(
      color: AppColors.surfaceBackground,
      elevation: 4,
      shadowColor: AppColors.baseAccentShadows,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Button Styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryInteraction,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
  );
}

// --- 4. Application and Demo Widget ---