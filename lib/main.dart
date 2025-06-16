import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/common/cubit/cubit/theme_cubit.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/constants/string.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/feature/home.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider<ThemeCubit>(
      create: (context)=>ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          print(state.themeMode);
          return MaterialApp(
            title: AppStrings.instance.appName,
            // themeMode: state.themeMode,
            themeMode: ThemeMode.dark,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.drakTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
