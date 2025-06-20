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
                               bodyLarge: TextStyle(
                           
                               fontSize:SizeConfig.isDesktop()? 20:18,
                              fontWeight: FontWeight.w400
                             ),
                             
      )
     );

      static ThemeData drakTheme=ThemeData(
        brightness: Brightness.dark,
      fontFamily: AppStrings.instance.fontfamily,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
      appBarTheme: AppBarTheme(
        backgroundColor:AppColors.backgroundDark ,
      ),
      textTheme: TextTheme(
        
        headlineLarge: TextStyle(
                               color:Colors.white ,
                                fontSize:SizeConfig.isMobile()?36:SizeConfig.isTablet()?40 :55,
                               fontWeight: FontWeight.w700
                             ),
                              bodyLarge: TextStyle(
                               color:Colors.white ,
                               fontSize:SizeConfig.isDesktop()? 20:18,
                              fontWeight: FontWeight.w400
                             ),

                             
      )
     );
   


}