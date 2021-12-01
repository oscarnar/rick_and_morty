import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color.dart';
import 'package:rick_and_morty/theme/typography.dart';

enum AppTheme {
  light,
  dark,
}

enum ScreenSized {
  small,
  medium,
  large,
}

abstract class ScreenSize {
  /// Max width for a small layout.
  static const double small = 760;

  /// Max width for a medium layout.
  static const double medium = 1200;

  /// Max width for a large layout.
  static const double large = 1800;
}

class RickAndMortyTheme {
  static ThemeData get standard {
    return ThemeData(primarySwatch: Colors.green);
  }

  static ThemeData get small {
    return ThemeData(primarySwatch: Colors.red);
  }

  static ThemeData get large {
    return ThemeData(primarySwatch: Colors.blueGrey);
  }

  static ThemeData toDarkTheme(ThemeData current) {
    return standard.copyWith(
      colorScheme: const ColorScheme.dark(),
      brightness: Brightness.dark,
      backgroundColor: RickAndMortyColors.black25,
      scaffoldBackgroundColor: RickAndMortyColors.black25,
      cardColor: RickAndMortyColors.black54,
      textTheme: Typography.whiteCupertino,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: RickAndMortyColors.black25,
        selectedItemColor: RickAndMortyColors.green,
        unselectedItemColor: RickAndMortyColors.white,
      ),
    );
  }

  static ThemeData toLightTheme(ThemeData current) {
    return large.copyWith(
      colorScheme: const ColorScheme.light(),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: RickAndMortyTextStyle.headline1,
      headline2: RickAndMortyTextStyle.headline2,
      headline3: RickAndMortyTextStyle.headline3,
      headline4: RickAndMortyTextStyle.headline4,
      headline5: RickAndMortyTextStyle.headline5,
      headline6: RickAndMortyTextStyle.headline6,
      subtitle1: RickAndMortyTextStyle.subtitle1,
      subtitle2: RickAndMortyTextStyle.subtitle2,
      bodyText1: RickAndMortyTextStyle.bodyText1,
      bodyText2: RickAndMortyTextStyle.bodyText2,
      caption: RickAndMortyTextStyle.caption,
      overline: RickAndMortyTextStyle.overline,
      button: RickAndMortyTextStyle.button,
    );
  }
}
