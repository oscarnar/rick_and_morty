import 'package:flutter/material.dart';

abstract class RickAndMortyColors {
  /// Black
  static const Color black = Color(0xFF202124);

  /// Black 54% opacity
  static const Color black54 = Color(0x8A000000);

  /// Black 25% opacity
  static const Color black25 = Color(0x40202124);

  /// Gray
  static const Color gray = Color(0xFFCFCFCF);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// WhiteBackground
  static const Color whiteBackground = Color(0xFFE8EAED);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Blue
  static const Color blue = Color(0xFF428EFF);

  /// Red
  static const Color red = Color(0xFFFB5246);

  /// Green
  static const Color green = Color(0xFF3fBC5C);

  /// Orange
  static const Color orange = Color(0xFFFFBB00);

  /// Charcoal
  static const Color charcoal = Color(0xBF202124);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF524D95,
    <int, Color>{
      50: Color(0xFFD4D0EB),
      100: Color(0xFFD4D0EB),
      200: Color(0xFFD4D0EB),
      300: Color(0xFF938FC2),
      400: Color(0xFF524D95),
      500: Color(0xFF524D95),
      600: Color(0xFF373385),
      700: Color(0xFF373385),
      800: Color(0xFF00005C),
      900: Color(0xFF00005C),
    },
  );

  static const MaterialColor secondarySwatch = MaterialColor(
    0xFFEABD26,
    <int, Color>{
      50: Color(0xFFFFF79E), 
      100: Color(0xFFFFF79E),
      200: Color(0xFFF8E476),
      300: Color(0xFFF8E476),
      400: Color(0xFFEABD26),
      500: Color(0xFFEABD26),
      600: Color(0xFFB8921D),
      700: Color(0xFFB8921D),
      800: Color(0xFF3C2705),
      900: Color(0xFF3C2705),
    },
  );

  static const MaterialColor tertiarySwatch = MaterialColor(
    0xFF00B1E5,
    <int, Color>{
      50: Color(0xFFEBF5FF), 
      100: Color(0xFFEBF5FF),
      200: Color(0xFF9DDEF6),
      300: Color(0xFF9DDEF6),
      400: Color(0xFF00B1E5),
      500: Color(0xFF00B1E5),
      600: Color(0xFF26BAE5),
      700: Color(0xFF26BAE5),
      800: Color(0xFF002D33),
      900: Color(0xFF002D33),
    },
  );
}