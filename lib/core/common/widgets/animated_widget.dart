
import 'package:flutter/material.dart';

class AnimatedCustomWidget extends StatelessWidget {
  const AnimatedCustomWidget({super.key, required this.child, this.index=0});
  final Widget child;
  final int index; 

  @override
  Widget build(BuildContext context) {
    return  TweenAnimationBuilder<double>(
                                tween: Tween<double>(
              begin: 1,
              end: 0,
            ),
            duration:  Duration(milliseconds:1000+(index*100)),
            curve: Curves.decelerate,
                           builder: (context,value,childWidget) {
                                  
                             return Transform.translate(
                             
                               offset: Offset(0, 100*value),
                               child: Opacity(
                                opacity: 1-value,
                                 child: Container(
                                  color: Colors.transparent,
                                   child: child,
                                 ),
                               ),
                             );
                           }
                         );
  }
}