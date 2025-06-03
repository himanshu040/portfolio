import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        foreground: Paint()
          ..shader = gradient.createShader(
            const Rect.fromLTWH(0, 0, 200, 70),
          ),
      ),
    );
  }
}