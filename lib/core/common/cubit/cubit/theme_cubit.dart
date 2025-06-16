import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(  ThemeState(themeMode: ThemeMode.light, isDark: false),);

  void toggleTheme() {
    if (state.isDark) {
      emit(
        ThemeState(themeMode: ThemeMode.light, isDark: false),
      );
    } else {
      emit(
        ThemeState(themeMode: ThemeMode.dark, isDark: true),
      );
    }
  }
}
