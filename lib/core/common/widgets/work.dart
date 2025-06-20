import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class Work extends StatelessWidget {
  const 
  
  
  
  Work({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
    );
  }
}


class SliderAnimation extends StatefulWidget {
  const SliderAnimation({super.key});

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0,
      end: 5000
      ),
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 2000),
      builder: (context,value,child) {
        return Container(
          height: value,
          width: 3,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                       // indigo-500
                        Color(0xFF8B5CF6),
                        AppColors.primary
                    ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
          ),
        );
      }
    );
  }
}


