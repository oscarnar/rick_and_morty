import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        emit(state.copyWith(
          isDarkMode: false,
          themeData: RickAndMortyTheme.toLightTheme(state.themeData),
        ));
        break;
      case AppTheme.dark:
        emit(state.copyWith(
          isDarkMode: true,
          themeData: RickAndMortyTheme.toDarkTheme(state.themeData),
        ));
        break;
      default:
        emit(ThemeInitial());
    }
  }

  void responsiveTheme(BoxConstraints constraints) {
    if (state.isDarkMode) return;
    
    if (constraints.maxWidth <= ScreenSize.small) {
      emit(state.copyWith(themeData: RickAndMortyTheme.small));
    } else if (constraints.maxWidth <= ScreenSize.medium) {
      emit(state.copyWith(themeData: RickAndMortyTheme.standard));
    } else if (constraints.maxWidth <= ScreenSize.large) {
      emit(state.copyWith(themeData: RickAndMortyTheme.large));
    } else {
      emit(state.copyWith(themeData: RickAndMortyTheme.large));
    }
  }

}
