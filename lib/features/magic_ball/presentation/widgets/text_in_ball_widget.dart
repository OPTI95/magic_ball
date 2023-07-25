import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/magic_ball_cubit.dart';

class TextInBallWidget extends StatelessWidget {
  const TextInBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicBallCubit, MagicBallState>(
      builder: (context, state) {
        if (state is MagicBallLoadedState) {}
        return SizedBox(
          width: 240,
          child: state is MagicBallLoadedState
              ? AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      state.reading,
                      textAlign: TextAlign.center,
                      textStyle:
                          const TextStyle(fontSize: 32, color: Colors.white),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  repeatForever: false,
                  pause: const Duration(milliseconds: 10),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              : const Text(""),
        );
      },
    );
  }
}