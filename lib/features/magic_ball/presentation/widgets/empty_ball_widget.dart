import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/magic_ball_cubit.dart';

class EmptyBallWidget extends StatelessWidget {
  const EmptyBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1), // Set the duration for the animation
      height: 380,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color:
                context.watch<MagicBallCubit>().state is MagicBallLoadingState
                    ? Colors.black.withOpacity(0.3)
                    : Colors.blue.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Image.asset(
        'assets/images/ball.png',
        fit: BoxFit.cover,
      ),
    );
  }
}