import 'package:flutter/material.dart';
import 'package:portfolio/feature/home.dart';

enum ListDirection {
  leftToRight,
  topToBottom,
  rightToLeft,
  bottomToTop,
}

class AnimatedCustomWidget extends StatefulWidget {
  const AnimatedCustomWidget(
      {super.key,
      required this.child,
      this.isInitial = false,
      this.offsetY = 0,
      this.duration = const Duration(milliseconds: 800),
      this.listDirection = ListDirection.bottomToTop});
  final Widget child;
  final bool isInitial;

  final double offsetY;
  final Duration duration;

  final ListDirection listDirection;

  @override
  State<AnimatedCustomWidget> createState() => _AnimatedCustomWidgetState();
}

class _AnimatedCustomWidgetState extends State<AnimatedCustomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  final GlobalKey _sectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    if (widget.isInitial == true) {
      _animationController.forward();
      _hasAnimated = true;
    }
    scrollController.addListener(_checkVisibility);
  }

  void _checkVisibility() {
    if (_hasAnimated) return;

    if (widget.isInitial == true) {
      _animationController.forward();
      _hasAnimated = true;
    } else {
      final RenderBox? box =
          _sectionKey.currentContext?.findRenderObject() as RenderBox?;

      if (box != null) {
        final position = box.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;

        if (position.dy < screenHeight && position.dy + box.size.height > 0) {
          _animationController.forward();
          _hasAnimated = true;
        }
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    scrollController.removeListener(_checkVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          final value = _animation.value;
          return Transform.translate(
            offset: getOffset(value),
            child: Opacity(
              opacity: 1 - value,
              child: Container(
                color: Colors.transparent,
                key: _sectionKey,
                child: widget.child,
              ),
            ),
          );
        });
  }

  Offset getOffset(double value) {
    switch (widget.listDirection) {
      case ListDirection.bottomToTop:
        return Offset(0, 100 * value);

      case ListDirection.leftToRight:
        return Offset(-100 * value, 0);
      case ListDirection.rightToLeft:
        return Offset(100 * value, 0);
      case ListDirection.topToBottom:
        return Offset(100 * value, 0);
    }
  }
}
