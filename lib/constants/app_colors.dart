import 'package:flutter/material.dart';

// --- 1. Hex Color Utility ---
/// Converts a hex code string (e.g., "#C93030") to a Flutter Color object.
Color hexToColor(String hexCode) {
  // Remove the '#' if present
  final hex = hexCode.replaceAll('#', '');

  // Parse the hex color and prepend the alpha value (FF for fully opaque)
  return Color(int.parse('FF$hex', radix: 16));
}

// --- Color Constants (Based on Shaheen Corporate & Service Theme) ---

class AppColors {
  // Core Palette
  // Based on Shaheen Logo Red (#C93030) and clean, high-contrast surfaces.
  static final Color primaryInteraction = hexToColor('#C93030'); // Shaheen Red (Primary Action/Buttons, Branding)
  static final Color surfaceBackground = hexToColor('#FFFFFF'); // Pure White (Main Screen Background)
  static final Color baseAccentShadows = hexToColor('#F5F5F5'); // Light Gray (Subtle Accent/Shadows)
  static final Color primaryText = hexToColor('#262626'); // Near-Black (Primary Text for readability)
  static final Color secondaryTextHint = hexToColor('#7D7D7D'); // Medium Gray (Secondary Text/Hints/Inactive Icons)

  // Data & Status Colors
  static final Color dataViz1 = hexToColor('#0074D9'); // Corporate Blue (Main Data/Charts, Stability)
  static final Color dataViz2 = hexToColor('#B3D9FF'); // Light Blue (Supporting Data/Light Accent)
  static final Color dataViz3 = hexToColor('#FFB74D'); // Amber Orange (Warning/Pending Status)
  static final Color dataViz4 = hexToColor('#4CAF50'); // Service Green (Success/Complete Status)
  static const Color danger = Color(0xFFD32F2F); // Red
  static const Color info = Color(0xFF1E88E5); 

  // --- Container / Card Theme Colors ---

  /// The default light background color for cards and containers.
  static final Color cardDefaultBackground = surfaceBackground;

  /// A slightly tinted background for alternate containers or sections.
  static final Color cardAccentBackground = dataViz2.withOpacity(0.5);

  /// The color used for shadows beneath cards.
  static final Color cardShadowColor = primaryInteraction.withOpacity(0.1);

  /// A color for borders or outlines on containers.
  static final Color cardBorderColor = dataViz1.withOpacity(0.5);
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

    // Cointainer Styling
  
    // Bottom Navigation Bar Styling
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceBackground,
      selectedItemColor: AppColors.primaryInteraction,
      unselectedItemColor: AppColors.secondaryTextHint,
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
