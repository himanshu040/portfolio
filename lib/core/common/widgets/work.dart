import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
       SliderAnimation(
        workClass: WorkClass(desc: "",projectname: "MyDigicel Pacific",skills: [
          "Flutter",
          "Bloc",
          "Payment Gateway"
        
        ]),
       ),
       SizedBox(height: 1000,)
         
        ],
      ),
    );
  }
}





class SliderAnimation extends StatefulWidget {
  const SliderAnimation({super.key,required this.workClass});

 final WorkClass workClass;

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {


  double scrollOffset = 0;
  late WorkClass _work;

  @override
  void initState() {
    super.initState();
    _work=widget.workClass;
   
  }
  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Text(_work.projectname,
            style: GoogleFonts.abrilFatface(
               textStyle: Theme.of(context).textTheme.displaySmall,
            ),
        
            
            ),
        
            SizedBox(
              height: 20,
            ),
            
           Wrap(
            spacing:10,
            children:_work.skills.map((e)=> Container(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              color: Color(0xFF082F49),
              child: Text(e,
              style: TextStyle(
                color: Color(0xFF7DD3FC),
                fontSize: 18,
                fontWeight: FontWeight.w200,
                
              ),
              ),
            )).toList()
            
            
            
           )
           ],
        ),
    
        Card(
          elevation: 5,
          child: Stack(
            children: [

              Image.asset("asset/images/digicel/digicel_home.jpeg",
              )

            ],
          ),
        )
        // Container(
        //   height: 500,
        //   width: 250,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       colors: [
        //            Color(0xffCF2194),
        //        Colors.white,
             
        //       Color(0xffCF2194),
              
        //     ],
        //    stops: [0.0, 0.05, 1]
            
        //     ),
        //     borderRadius: BorderRadius.circular(20)
        //   ),
        // )
       
    
      ],
    );
  }
}


class WorkClass{

 WorkClass({required this.projectname,required this.desc,required this.skills,this.link});
 final String projectname;
 final String desc;
 final List<String> skills;
 final String? link;


}