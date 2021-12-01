part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final bool isDarkMode;
  final ThemeData themeData;

  const ThemeState({
    required this.isDarkMode,
    required this.themeData,
  });

  ThemeState copyWith({
    int? pageIndex,
    bool? isDarkMode,
    ThemeData? themeData,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      themeData: themeData ?? this.themeData,
    );
  }
}

class ThemeInitial extends ThemeState {
  ThemeInitial()
      : super(
          isDarkMode: false,
          themeData: RickAndMortyTheme.standard,
        );
}

class DarkThemeState extends ThemeState {
  DarkThemeState(current)
      : super(
          isDarkMode: true,
          themeData: RickAndMortyTheme.toDarkTheme(current),
        );
}

class LightThemeState extends ThemeState {
  LightThemeState(current)
      : super(
          isDarkMode: true,
          themeData: RickAndMortyTheme.toLightTheme(current),
        );
}
