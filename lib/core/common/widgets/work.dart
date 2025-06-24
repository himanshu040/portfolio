import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

class Work extends StatelessWidget {
  const 
  
  
  
  Work({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
         padding:  EdgeInsets.symmetric(horizontal:SizeConfig.isTablet()||SizeConfig.isMobile()? 40: 100, vertical: 60),
      child: Column(
      
        children: [
          Text(
            "Works.",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Check out the projects that I have done.",
            style:  Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Get to know me better.",
            style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                 foreground: Paint()
                                   ..shader = LinearGradient(
                                       stops: [
                                        0,
                                        1
                                       ],
                                    colors: [
                                           Color.fromARGB(255, 47, 50, 240), // indigo-500
                                             Color.fromARGB(255, 175, 150, 235),
                                         ]).createShader(
                                     const Rect.fromLTWH(0, 0, 200, 70)                       ),
            ),
          ),
       SliderAnimation(),
       SizedBox(height: 1000,)
         
        ],
      ),
    );
  }
}





class SliderAnimation extends StatefulWidget {
  const SliderAnimation({super.key});

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {

   final ScrollController _scrollController = ScrollController();
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
      final verticalShift = (scrollOffset / 2).clamp(0.0, 150.0);
      print(verticalShift);
    return  SingleChildScrollView(
        controller: _scrollController,
            
            child: SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                         offset: Offset(0, verticalShift),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                           children: [
                            Text("Opus Forex Website",
                            
                            )
                           ],
                        ),
                                    
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 47, 50, 240),
                            shape: BoxShape.circle
                                    
                          ),
                         
                        ),
                      ],
                    ),
                  ),
              
                  Container(
                    height: 300,
                    width: 100,
                    color: Colors.white,
                  )
                 
              
                ],
              ),
            ),
          );
  }
}


