import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/string.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class AppTheme {
     

     static ThemeData lightTheme=ThemeData(
      fontFamily: AppStrings.instance.fontfamily,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor:AppColors.background ,
      )
     );
   


}