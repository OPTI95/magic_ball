import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/magic_ball_cubit.dart';

class ShadowBallWidget extends StatelessWidget {
  const ShadowBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        context.watch<MagicBallCubit>().state is MagicBallErrorState
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/circle.png',
                  scale: 3,
                  color: Colors.red,
                ))
            : Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/circle.png',
                  scale: 3,
                )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/shadowToCircle.png',
            scale: 3,
          ),
        )
      ],
    );
  }
}