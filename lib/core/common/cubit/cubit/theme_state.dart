part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final bool isDark;

  const ThemeState({required this.themeMode, required this.isDark});

  @override
  List<Object?> get props => [themeMode, isDark];
}
