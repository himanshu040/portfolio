import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
                                      padding: EdgeInsets.all(5),
                                      
                                      decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 4),
                                      
                                                             ),
                                                             child: ClipOval(
                                       child: Image(
                                        image: AssetImage('asset/images/profile.jpeg'),
                                        height:SizeConfig.isMobile()?200: 300,
                                        width:SizeConfig.isMobile()?200: 300, // Replace with your image
                                        fit: BoxFit.cover,
                                      ),
                                                             ),
                                     );
  }
}