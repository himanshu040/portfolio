import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/dimensions.dart';

class Button extends StatefulWidget {
  const Button({required this.text, this.onClick, super.key});
  final String text;
  final Function? onClick;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => isHovered = true);
      },
      onExit: (_) => setState(() => isHovered = false),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            if (widget.onClick != null) {
              widget.onClick!();
            }
          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // height: 40,
            // width: 80,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 47, 50, 240),
                  Color.fromARGB(255, 175, 150, 235),
                ])),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.isMobile() ? 10 : 15,
                  vertical: SizeConfig.isMobile() ? 5 : 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.radius),
                  color: isHovered ? Colors.transparent : Colors.black),
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: isHovered
                        ? SizeConfig.isMobile()
                            ? 12
                            : 13
                        : SizeConfig.isMobile()
                            ? 11
                            : 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
