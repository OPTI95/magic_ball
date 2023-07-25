import 'package:flutter/material.dart';

import 'ball_widget.dart';

class AnimationBallWidget extends StatelessWidget {
  const AnimationBallWidget({
    super.key,
    required Animation<double> animationBall,
    required Animation<double> animationStar,
    required Animation<double> animationStars,
  })  : _animationBall = animationBall,
        _animationStar = animationStar,
        _animationStars = animationStars;

  final Animation<double> _animationBall;
  final Animation<double> _animationStar;
  final Animation<double> _animationStars;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationBall,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animationBall.value),
          child: BallWidget(
              animationStar: _animationStar, animationStars: _animationStars),
        );
      },
    );
  }
}