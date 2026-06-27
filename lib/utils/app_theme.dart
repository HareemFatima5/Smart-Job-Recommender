// utils/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ─── Brand Palette ────────────────────────────────────────────────────
  // NOTE: 'primary' is now dynamic — use AppProvider.accentColor in widgets
  // that need to react to the user's accent choice. AppTheme.primary remains
  // as the compile-time default (Purple) for widgets that don't need to react.
  static const Color primary       = Color(0xFF6C63FF);
  static const Color secondary     = Color(0xFF48CAE4);
  static const Color accent        = Color(0xFFFFD93D);
  static const Color surface       = Color(0xFF13132B);
  static const Color cardBg        = Color(0xFF1E1E3A);
  static const Color textPrimary   = Colors.white;
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color success       = Color(0xFF6BCB77);
  static const Color warning       = Color(0xFFFF922B);
  static const Color error         = Color(0xFFFF6B6B);
  static const Color linkedInBlue  = Color(0xFF0A66C2);

  /// All accent color options available in Settings
  static const Map<String, Color> accentOptions = {
    'Purple': Color(0xFF6C63FF),
    'Cyan':   Color(0xFF48CAE4),
    'Green':  Color(0xFF6BCB77),
    'Orange': Color(0xFFFF922B),
    'Pink':   Color(0xFFF472B6),
  };

  static Color accentFromName(String name) =>
      accentOptions[name] ?? const Color(0xFF6C63FF);

  /// Build a full MaterialApp theme using the chosen accent color.
  /// Called from main.dart every time the accent changes — Flutter
  /// rebuilds the entire widget tree with the new ColorScheme automatically.
  static ThemeData buildTheme(Color accentColor) => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: Brightness.dark,
    ).copyWith(
      primary:   accentColor,
      secondary: secondary,
      surface:   surface,
      error:     error,
    ),
    scaffoldBackgroundColor: surface,
    textTheme: GoogleFonts.interTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: surface,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) =>
      states.contains(WidgetState.selected)
          ? accentColor
          : Colors.white24),
      trackColor: WidgetStateProperty.resolveWith((states) =>
      states.contains(WidgetState.selected)
          ? accentColor.withOpacity(0.4)
          : Colors.white.withOpacity(0.08)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)),
        textStyle: GoogleFonts.inter(
            fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accentColor,
        side: BorderSide(color: accentColor),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardBg,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.white12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.white12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: accentColor, width: 2),
      ),
      labelStyle: const TextStyle(color: Color(0xFF888888)),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 16),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      color: cardBg,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: accentColor.withOpacity(0.15),
      labelStyle: GoogleFonts.inter(
          fontSize: 12, color: accentColor),
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentColor,
      foregroundColor: Colors.white,
    ),
    progressIndicatorTheme:
    ProgressIndicatorThemeData(color: accentColor),
  );

  static ThemeData get lightTheme => buildTheme(primary);
}