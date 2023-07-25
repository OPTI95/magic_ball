import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:magic_ball/features/magic_ball/presentation/cubit/magic_ball_cubit.dart';
import 'package:shake/shake.dart';

import '../widgets/animation_ball_widget.dart';
import '../widgets/shadow_ball_widget.dart';
import '../widgets/text_bottom_widget.dart';

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage>
    with TickerProviderStateMixin {
  FlutterTts flutterTts = FlutterTts();
  late AnimationController _controller;
  late AnimationController _controllerStar;
  late AnimationController _controllerStars;
  late Animation<double> _animationBall;
  late Animation<double> _animationStar;
  late Animation<double> _animationStars;

  @override
  void initState() {
    super.initState();
    shakeReading();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Повторяем анимацию вперед и назад
    _controllerStar = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat(reverse: true);

    _controllerStars = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _animationBall = defaultAnimationBall();
    _animationStar = Tween<double>(
      begin: 0.0, // Начальное положение звезды (по градусам)
      end: 10.0, // Конечное положение звезды (по градусам)
    ).animate(CurvedAnimation(
      parent: _controllerStar,
      curve: Curves.linearToEaseOut,
    ));
    _animationStars = Tween<double>(
      begin: -1.0, // Начальное положение звезды (по градусам)
      end: 1.0, // Конечное положение звезды (по градусам)
    ).animate(CurvedAnimation(
      parent: _controllerStars,
      curve: Curves.linearToEaseOut,
    ));
  }

  ShakeDetector shakeReading() {
    return ShakeDetector.autoStart(onPhoneShake: () async {
      await getRandomReading();
      // Do stuff on phone shake
    });
  }

  Future<void> getRandomReading() async {
    await context.read<MagicBallCubit>().getRandomReading();
  }

  Animation<double> defaultAnimationBall() {
    return Tween<double>(
      begin: -10.0, // Начальное положение шара (по вертикали)
      end: 10.0, // Конечное положение шара (по вертикали)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerStar.dispose();
    _controllerStars.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        color: Color.fromRGBO(114, 114, 114, 1),
        fontSize: 16,
        fontWeight: FontWeight.w400);
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 19, 0, 58),
                  Color.fromARGB(255, 16, 0, 45),
                  Color.fromARGB(255, 9, 0, 57),
                ]),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () async {
                    await getRandomReading();
                  },
                  child: AnimationBallWidget(
                      animationBall: _animationBall,
                      animationStar: _animationStar,
                      animationStars: _animationStars),
                ),
                ShadowBallWidget(),
                TextBottomWidget(textStyle: textStyle)
              ])),
    );
  }
}
