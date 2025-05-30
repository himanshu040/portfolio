import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/dimensions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
   SizeConfig.init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Row(
          children: [
            Text("Muhammad Anus Gul", style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24
            ),)
          ],
        ),
      ),
      
    );
  }
}