import 'package:flutter/material.dart';

class BigStarWidget extends StatelessWidget {
  const BigStarWidget({
    super.key,
    required Animation<double> animationStar,
  }) : _animationStar = animationStar;

  final Animation<double> _animationStar;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationStar,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _animationStar.value,
          child: Image.asset(
            'assets/images/star.png',
            scale: 5,
          ),
        );
      },
    );
  }
}