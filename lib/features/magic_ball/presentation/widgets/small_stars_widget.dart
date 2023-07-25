import 'package:flutter/material.dart';

class SmallStarsWidget extends StatelessWidget {
  const SmallStarsWidget({
    super.key,
    required Animation<double> animationStars,
  }) : _animationStars = animationStars;

  final Animation<double> _animationStars;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationStars,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _animationStars.value,
          child: Image.asset(
            'assets/images/stars.png',
            scale: 4,
          ),
        );
      },
    );
  }
}