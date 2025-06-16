import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/common/cubit/cubit/theme_cubit.dart';
import 'package:portfolio/core/common/widgets/animated_widget.dart';
import 'package:portfolio/core/common/widgets/text_gradient.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/feature/home.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      // decoration: const BoxDecoration(
      //   color: Colors.transparent, // Initially transparent
      // ),
      child: SafeArea(
        child:  Padding(
          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.horizontalmargin ),
          child: Row(
            children: [
              AnimatedCustomWidget(
                child: GradientText("Himanshu Singh", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFF6366F1), // indigo-500
                    Color(0xFF8B5CF6),
                ]),),
              ),
              Spacer(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(!SizeConfig.isMobile())
                Row(
                  children: [
                    TextAnimatedButton(text: "Home",),
                    SizedBox(width: 40,),
                     TextAnimatedButton(text: "Projects",),
                      SizedBox(width: 40,),
                      TextAnimatedButton(text: "Skills",),
                       SizedBox(width: 40,),
                       TextAnimatedButton(text: "Contact",),
                        SizedBox(width: 40,),
                  ],
                ),
                    // _IconButton(onPressed: (){
                    //   BlocProvider.of<ThemeCubit>(context).toggleTheme();
                    // },icon: Icons.wb_sunny_outlined,tooltip: "Night Mode")

              ],
            ),
          
            ],
          ),
        )
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

// Navigation Link Button Widget
Widget _NavItem(String title, String href, bool isDark) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // TODO: implement scroll to section
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: 0, // set to full on hover with animations
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Icon Button Widget
Widget _IconButton({required IconData icon, required String tooltip, required VoidCallback onPressed}) {
  return Tooltip(
    message: tooltip,
    child: GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
    ),
  );
}