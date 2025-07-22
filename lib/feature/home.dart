import 'package:flutter/material.dart';
import 'package:portfolio/core/common/widgets/app_bar.dart';
import 'package:portfolio/core/common/widgets/contact.dart';
import 'package:portfolio/core/common/widgets/home.dart';
import 'package:portfolio/core/common/widgets/resume.dart';
import 'package:portfolio/core/common/widgets/work.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';

ScrollController scrollController = ScrollController();
GlobalKey homeKey = GlobalKey();
GlobalKey worksKey = GlobalKey();
GlobalKey resumeKey = GlobalKey();
GlobalKey contactKey = GlobalKey();
void scrollToSection(GlobalKey key) {
  final BuildContext? context = key.currentContext;
  if (context != null) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero, ancestor: null).dy +
        scrollController.offset;
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: SizeConfig.isMobile()
            ? null
            : CustomHeader(
                onItemTap: scrollToSection,
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Home(
                key: homeKey,
              ),
              Work(
                scrollController: scrollController,
                key: worksKey,
              ),
              Resume(
                key: resumeKey,
                scrollController: scrollController,
              ),
              Contact(
                key: contactKey,
              )
            ],
          ),
        )
        );
  }
}

class TextAnimatedButton extends StatefulWidget {
  const TextAnimatedButton(
      {required this.text, required this.widgetKey, super.key});
  final String text;
  final GlobalKey widgetKey;

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
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
              color: isHovered
                  ? AppColors.primary
                  : isDark
                      ? Colors.white
                      : Color(0xff374151),
              fontSize: isHovered ? 16 : 15,
              fontWeight: FontWeight.w400,
            ),
            child: GestureDetector(
              onTap: () {
                debugPrint('Button tapped!');
                scrollToSection(widget.widgetKey);
              },
              child: Text(key: _textKey, widget.text),
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
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => _getTextWidth());
              return Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 2,
                  width: textWidth * value, // adjust max width here
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      gradient: LinearGradient(colors: [
                        Color(0xFF6366F1), // indigo-500
                        Color(0xFF8B5CF6),
                      ])),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
