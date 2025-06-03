import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/common/widgets/text_gradient.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
   SizeConfig.init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.3),
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        leading: SizedBox(),
        title: Padding(
          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.horizontalmargin ),
          child: Row(
            children: [
              GradientText("Himanshu Singh", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),gradient: LinearGradient(colors: [
                Color(0xFF6366F1), // indigo-500
                  Color(0xFF8B5CF6),
              ]),),
              Spacer(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextAnimatedButton(text: "Home",),
                SizedBox(width: 40,),
                 TextAnimatedButton(text: "Projects",),
                  SizedBox(width: 40,),
                  TextAnimatedButton(text: "Skills",),
                   SizedBox(width: 40,),
                   TextAnimatedButton(text: "Contact",),
                    // SizedBox(width: 40,),
              ],
            ),
          
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
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
            
                     padding:  EdgeInsets.symmetric(horizontal:SizeConfig.isTablet()||SizeConfig.isMobile()? SizeConfig.screenWidth*0.10: SizeConfig.screenWidth*0.22, vertical: 60),
                    child: Column(
                      children: [
                         Stack(
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
                         Text(
                          "Mobile App Developer",
                          style: TextStyle(
                            fontSize:SizeConfig.isMobile()?36:SizeConfig.isTablet()?48 :60,
                            fontWeight: FontWeight.w700
                          ),
                          textAlign: TextAlign.center,
                         ),
                         SizedBox(
                          height: 10,
                         ),
                          Text(
                          "I'm a passionate Mobile Application developer building sleek, performant apps and powerful backend solutions with SpringBoot and Firebase — used and loved by thousands globally.",
                          style: TextStyle(
                            fontSize:SizeConfig.isDesktop()? 20:18,
                            fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.center,
                         ),
                          SizedBox(
                          height: 20,
                         ),
                        Wrap(
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
                      ],
                    ),
                   ),
                 )         
                ],
              ),
            )
        
          ],
        ),
      ),
      
    );
  }
}

class TextAnimatedButton extends StatefulWidget {
  const TextAnimatedButton({required this.text,super.key});
  final String text;
  @override
  State<TextAnimatedButton> createState() => _TextAnimatedButtonState();
}

class _TextAnimatedButtonState extends State<TextAnimatedButton> {

 final GlobalKey _textKey = GlobalKey();
  double textWidth = 0;

   @override
  void initState() {
    super.initState();

    // Wait for layout to complete to get the text width
    WidgetsBinding.instance.addPostFrameCallback((_) => _getTextWidth());
  }

  void _getTextWidth() {
    final RenderBox? renderBox =
        _textKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && mounted) {
      setState(() {
        textWidth = renderBox.size.width;
      });
    }
  }

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return   MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
      setState(() => isHovered = true);
     
    },
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedDefaultTextStyle(
          
                  duration: const Duration(milliseconds: 250),
                  
                  style: TextStyle(
                    
                    color: isHovered ? AppColors.primary : Color(0xff374151),
                    fontSize: isHovered ? 16:15,
                    fontWeight: FontWeight.w400,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('Button tapped!');
                    },
                    child:  Text(
                        key: _textKey,
                      
                      widget.text),
                  ),
                ),
                   const SizedBox(height: 4),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0,
              end: isHovered ? 1.0 : 0.0,
            ),
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
               WidgetsBinding.instance.addPostFrameCallback((_) => _getTextWidth());
              return Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 2,
                  width: textWidth* value, // adjust max width here
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(colors: [
                Color(0xFF6366F1), // indigo-500
                  Color(0xFF8B5CF6),
              ])
                 ),
                ),
              );
            },
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