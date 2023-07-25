import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_ball/features/magic_ball/presentation/widgets/small_stars_widget.dart';
import 'package:magic_ball/features/magic_ball/presentation/widgets/text_in_ball_widget.dart';

import '../cubit/magic_ball_cubit.dart';
import 'big_stars_widget.dart';
import 'empty_ball_widget.dart';
import 'error_ball_widget.dart';

class BallWidget extends StatelessWidget {
  const BallWidget({
    super.key,
    required Animation<double> animationStar,
    required Animation<double> animationStars,
  })  : _animationStar = animationStar,
        _animationStars = animationStars;

  final Animation<double> _animationStar;
  final Animation<double> _animationStars;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        context.watch<MagicBallCubit>().state is MagicBallErrorState
            ? ErrorBallWidget()
            : EmptyBallWidget(),
        BigStarWidget(animationStar: _animationStar),
        SmallStarsWidget(animationStars: _animationStars),
        TextInBallWidget(),
      ],
    );
  }
}