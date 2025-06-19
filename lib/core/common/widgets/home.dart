import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/common/widgets/animated_widget.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class Home extends StatelessWidget  {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   
     SizeConfig.init(context);
      final isDark = Theme.of(context).brightness == Brightness.dark;
      print("fdegfegr$isDark");
      List<String> positions=[
        "Software Developer",
        "Flutter Developer",
        "Android Developer",
        "Freelancer"
      ];
    return 
            Container(
              decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:isDark?
              [
                 AppColors.backgroundGradientDark2,
                AppColors.backgroundGradientDark1,
               
              ]
              :
                  [Colors.grey.shade50, Colors.grey.shade200],
            ),
              ),
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                   Positioned(
            top: 80,
            left: -96,
            child: PulsBlob(color: AppColors.primary)
          ),
                  
            
                         Positioned(
                          top: 400,
                           right: -100,
                           bottom: 70,
                           child: PulsBlob(color: AppColors.secondary)
                         ),
                 Container(
            
                     padding:  EdgeInsets.symmetric(horizontal:SizeConfig.isTablet()||SizeConfig.isMobile()? 40: 100, vertical: 60),
                    child:
                    SizeConfig.isMobile()?Column(
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
                                        height:SizeConfig.isMobile()?200: 300,
                                        width:SizeConfig.isMobile()?200: 300, // Replace with your image
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
                        
                       Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedCustomWidget(
                                  index: 0,
                                  child: Text.rich(
                                   TextSpan(children: [
                                    TextSpan(
                                       text: "Hello.\nI'm",
                                     style:Theme.of(context).textTheme.titleLarge!.copyWith(
                                      // fontSize:SizeConfig.isMobile()?36:SizeConfig.isTablet()?48 :60,
                                      )    ,
                                    ),
                                    TextSpan(
                                      text:" Himanshu.",
                                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
                               foreground: Paint()
                                 ..shader = LinearGradient(colors: [
                                         Color(0xFF6366F1), // indigo-500
                                           Color(0xFF8B5CF6),
                                       ]).createShader(
                                   const Rect.fromLTWH(0, 0, 200, 70),
                                 ),
                             ),
                                    )
                                   ])
                                    //  textAlign: TextAlign.center,
                                    
                                    ),
                                ),
                                                         SizedBox(
                                height: 10,
                                                         ),
                                AnimatedCustomWidget(
                                  index: 1,
                                  child: Text(
                                  "I'm a passionate Mobile Application developer building sleek, performant apps and powerful backend solutions with SpringBoot and Firebase — used and loved by thousands globally.",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    // fontSize:SizeConfig.isDesktop()? 20:18,
                                    // fontWeight: FontWeight.w400
                                  ),
                                  textAlign: TextAlign.center,
                                                           ),
                                ),
                                SizedBox(
                                height: 20,
                                                         ),
                                //                         AnimatedCustomWidget(
                                // index: 2,
                                // child: Wrap(
                                //                     spacing: 16,
                                //                     runSpacing: 8,
                                //                     alignment: WrapAlignment.center,
                                //                     children: [
                                //                       ElevatedButton.icon(
                                // onPressed: () {},
                                // icon: const Icon(CupertinoIcons.folder,color: Colors.white,),
                                // label: const Text("View My Work",
                                // style: TextStyle(
                                //   fontSize: 16,
                                //   fontWeight: FontWeight.w600,
                                //   color: Colors.white
                                // ),
                                // ),
                                // style: ElevatedButton.styleFrom(
                                //   backgroundColor: AppColors.buttons,
                                //   foregroundColor: Colors.black ,
                                //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(12),
                                //   ),
                                //   elevation: 10,
                                // ),
                                //                       ),
                                //                       ElevatedButton.icon(
                                // onPressed: () {},
                                //   icon: const Icon(Icons.send,color: Colors.black,),
                                // label: const Text("Get In Touch",
                                //  style: TextStyle(
                                //   fontSize: 16,
                                //   fontWeight: FontWeight.w600,
                                //   color: Colors.black
                                // ),
                                // ),
                                // style: ElevatedButton.styleFrom(
                                //   backgroundColor: Colors.white,
                                //   foregroundColor: Colors.black ,
                                //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(12),
                                //     side: BorderSide(
                                //       color: Colors.grey,width: 0.5
                                //     )
                                //   ),
                                //   elevation: 10,
                                // ),
                                //                       ),
                                                  
                                //                     ],
                                //                   ),
                                //                         ),
                              ],
                            ),
                   
                        
                     
                      ],
                    ):
                    
                     Padding(
                       padding:  EdgeInsets.only(top:SizeConfig.screenHeight*0.10,),
                       child: Row(
                        children: [
                          
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedCustomWidget(
                                    index: 0,
                                    child: Text.rich(
                                   TextSpan(children: [
                                    TextSpan(
                                       text: "Hello.\nI'm",
                                     style:Theme.of(context).textTheme.titleLarge!.copyWith(
                                      // fontSize:SizeConfig.isMobile()?36:SizeConfig.isTablet()?48 :60,
                                      )    ,
                                    ),
                                    TextSpan(
                                      text:" Himanshu.",
                                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
                               foreground: Paint()
                                 ..shader = LinearGradient(colors: [
                                         Color(0xFF6366F1), // indigo-500
                                           Color(0xFF8B5CF6),
                                       ]).createShader(
                                   const Rect.fromLTWH(0, 0, 200, 70),
                                 ),
                             ),
                                    )
                                   ])
                                    //  textAlign: TextAlign.center,
                                    
                                    ),
                                  ),
                                  AnimatedTextKit(animatedTexts: animatedTexts),
                        SizedBox(height: 10,) ,
                                  AnimatedCustomWidget(
                                    index: 1,
                                    child: Text(
                                    "I'm a passionate Mobile Application developer building sleek, performant apps and powerful backend solutions with SpringBoot and Firebase — used and loved by thousands globally.If you need a modern and powerful website, simply send me an email.",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      // fontSize:SizeConfig.isDesktop()? 20:18,
                                      // fontWeight: FontWeight.w400
                                    ),
                                    // textAlign: TextAlign.center,
                                                             ),
                                  ),
                                  // SizedBox(
                                  // height: 20,
                                  //                          ),
                                  //                         AnimatedCustomWidget(
                                  // index: 2,
                                  // child: Wrap(
                                  //                     spacing: 16,
                                  //                     runSpacing: 8,
                                  //                     alignment: WrapAlignment.center,
                                  //                     children: [
                                  //                       ElevatedButton.icon(
                                  // onPressed: () {},
                                  // icon: const Icon(CupertinoIcons.folder,color: Colors.white,),
                                  // label: const Text("View My Work",
                                  // style: TextStyle(
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w600,
                                  //   color: Colors.white
                                  // ),
                                  // ),
                                  // style: ElevatedButton.styleFrom(
                                  //   backgroundColor: AppColors.buttons,
                                  //   foregroundColor: Colors.black ,
                                  //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                  //   shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(12),
                                  //   ),
                                  //   elevation: 10,
                                  // ),
                                  //                       ),
                                  //                       ElevatedButton.icon(
                                  // onPressed: () {},
                                  //   icon: const Icon(Icons.send,color: Colors.black,),
                                  // label: const Text("Get In Touch",
                                  //  style: TextStyle(
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w600,
                                  //   color: Colors.black
                                  // ),
                                  // ),
                                  // style: ElevatedButton.styleFrom(
                                  //   backgroundColor: Colors.white,
                                  //   foregroundColor: Colors.black ,
                                  //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                  //   shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(12),
                                  //     side: BorderSide(
                                  //       color: Colors.grey,width: 0.5
                                  //     )
                                  //   ),
                                  //   elevation: 10,
                                  // ),
                                  //                       ),
                                                    
                                  //                     ],
                                  //                   ),
                                  //                         ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth*0.15,
                            ),
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
                                          height:SizeConfig.isMobile()?200: 400,
                                          width:SizeConfig.isMobile()?200: 400, // Replace with your image
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
                          
                        ],
                                           ),
                     ),
                   ),        
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


class PulsBlob extends StatefulWidget {
  const PulsBlob({required this.color,super.key});

 final Color color;

  @override
  State<PulsBlob> createState() => _PulsBlobState();
}

class _PulsBlobState extends State<PulsBlob> with  SingleTickerProviderStateMixin{

   late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scale = Tween(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Add optional delay
    Future.delayed(Duration.zero, () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
       animation: _controller,
      builder: (_, __) {
        return Transform.scale(
          scale: _scale.value,
          child: Container(
            
                 
                    width: 288,
                    height: 288,
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withOpacity(0.4),
                          blurRadius: 100,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                    child: BackdropFilter(filter: ImageFilter.blur(
                            sigmaX: 80,
                            sigmaY:80,

                           ),
                           child: SizedBox(),
                           ),
                  ),
        );
      }
    );
          
  }
}