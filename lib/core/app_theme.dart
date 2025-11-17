import 'package:flutter/material.dart';

class AppTheme {
  static final Color primary = const Color(0xFF3E2C41); // deep plum
  static final Color accent = const Color(0xFFF17CA3); // rose
  static final Color bg = const Color(0xFFF7F5F8); // warm off-white

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: bg,
    colorScheme: ColorScheme.fromSeed(
        seedColor: primary, primary: primary, secondary: accent),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primary,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  );
}
