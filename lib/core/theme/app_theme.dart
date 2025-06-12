import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/constants/string.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class AppTheme {
     

     static ThemeData lightTheme=ThemeData(
      fontFamily: AppStrings.instance.fontfamily,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor:AppColors.background ,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
                               fontSize:SizeConfig.isMobile()?36:SizeConfig.isTablet()?48 :60,
                               fontWeight: FontWeight.w700
                             ),
                             
      )
     );
   


}