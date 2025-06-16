import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;
  static late double padding;
  static late double gap;
  static late double radius;
  static late double horizontalmargin;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    padding= screenHeight/100;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;

    textMultiplier = blockHeight;
    imageSizeMultiplier = blockWidth;
    heightMultiplier = blockHeight;
    widthMultiplier = blockWidth;
    gap= blockWidth*4;
    radius=blockWidth*6;
    horizontalmargin= screenWidth*0.05;

  }


  static bool isMobile() => screenWidth < 600;
  static bool isTablet() => screenWidth >= 600 && screenWidth < 1024;
  static bool isDesktop() => screenWidth >= 1024;
}
