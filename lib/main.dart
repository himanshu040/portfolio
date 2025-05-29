import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/string.dart';
import 'package:portfolio/feature/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.instance.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
    home: const HomeScreen(),
    );
  }
}
