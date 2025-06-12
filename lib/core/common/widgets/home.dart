import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/common/widgets/animated_widget.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    return 
            Container(
              decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  [Colors.grey.shade50, Colors.grey.shade200],
            ),
              ),
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                 Transform.translate(
                  offset: Offset(-200, -50),
              
                   child: Container(
                     width: 400,
                     height: 400,
                     decoration: BoxDecoration(
                             // color: Colors.blue, /
                             shape: BoxShape.circle,// Replace with Theme.of(context).colorScheme.primary if needed
                           
              boxShadow: [
                BoxShadow(
                  color:AppColors.primary.withOpacity(0.3),
                  blurRadius: 70,
                  spreadRadius: 10,
                ),
              ],
                           ),
                   ),
                 ),
                  
            
                         Positioned(
                          top: 400,
                           right: 0,
                           child: Transform.translate(
                                         offset: Offset(200, 0),
                           
                                          child: Container(
                                            width: 400,
                                            height: 400,
                                            decoration: BoxDecoration(
                               // color: Colors.blue, // Replace with Theme.of(context).colorScheme.primary if needed
                               shape: BoxShape.circle,
                               boxShadow: [
                                 BoxShadow(
                                           color: AppColors.secondary.withOpacity(0.3),
                                           blurRadius: 100, // blur-3xl
                                           spreadRadius: 10,
                                 ),
                               ],
                             ),
                                          ),
                                        ),
                         ),
                 Center(
                   child: Container(
            
                     padding:  EdgeInsets.symmetric(horizontal:SizeConfig.isTablet()||SizeConfig.isMobile()? 40: 100, vertical: 60),
                    child: Column(
                      children: [
                        TweenAnimationBuilder<double>(
                                tween: Tween<double>(
              begin: 0,
              end: 1,
            ),
            duration: const Duration(milliseconds:1000),
            curve: Curves.linear,
                               builder: (context,value,child) {
                                 return Transform.scale(
                                 scale: value,
                               child: Opacity(
                                opacity: value,
                                 child: Stack(
                                   children: [
                                     Container(
                                      padding: EdgeInsets.all(5),
                                      
                                      decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 4),
                                      
                                                             ),
                                                             child: ClipOval(
                                       child: Image(
                                        image: AssetImage('asset/images/profile.jpeg'),
                                        height: 200,
                                        width: 200, // Replace with your image
                                        fit: BoxFit.cover,
                                      ),
                                                             ),
                                     ),
                                     Positioned(
                                      right: 0,
                                      bottom: 0,
                                       child: OnlineIndicator(),
                                     )
                                   ],
                                 ),
                               ),
                             );
                           }
                         ),
                          AnimatedCustomWidget(
                            index: 0,
                            child: Text(
                             "Mobile App Developer",
                             style:TextStyle(
                               fontSize:SizeConfig.isMobile()?36:SizeConfig.isTablet()?48 :60,
                               fontWeight: FontWeight.w700
                             ),
                             textAlign: TextAlign.center,
                            
                            ),
                          ),
                         SizedBox(
                          height: 10,
                         ),
                          AnimatedCustomWidget(
                            index: 1,
                            child: Text(
                            "I'm a passionate Mobile Application developer building sleek, performant apps and powerful backend solutions with SpringBoot and Firebase — used and loved by thousands globally.",
                            style: TextStyle(
                              fontSize:SizeConfig.isDesktop()? 20:18,
                              fontWeight: FontWeight.w400
                            ),
                            textAlign: TextAlign.center,
                                                     ),
                          ),
                          SizedBox(
                          height: 20,
                         ),
                        AnimatedCustomWidget(
                          index: 2,
                          child: Wrap(
                                              spacing: 16,
                                              runSpacing: 8,
                                              alignment: WrapAlignment.center,
                                              children: [
                                                ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.folder,color: Colors.white,),
                          label: const Text("View My Work",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttons,
                            foregroundColor: Colors.black ,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 10,
                          ),
                                                ),
                                                ElevatedButton.icon(
                          onPressed: () {},
                            icon: const Icon(Icons.send,color: Colors.black,),
                          label: const Text("Get In Touch",
                           style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black ,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: Colors.grey,width: 0.5
                              )
                            ),
                            elevation: 10,
                          ),
                                                ),
                                            
                                              ],
                                            ),
                        ),
                      ],
                    ),
                   ),
                 )         
                ],
              ),
            );
  }
}


class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
          ),
        ],
      ),
      child: const AnimatedPingDot(),
    );
  }
}

class AnimatedPingDot extends StatefulWidget {
  const AnimatedPingDot({super.key});

  @override
  State<AnimatedPingDot> createState() => _AnimatedPingDotState();
}

class _AnimatedPingDotState extends State<AnimatedPingDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final scale = 1 + (_controller.value * 0.5);
        final opacity = 1.0 - _controller.value;
        return Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}