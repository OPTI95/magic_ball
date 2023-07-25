import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:magic_ball/core/usecases/usecase.dart';
import 'package:magic_ball/features/magic_ball/domain/usecases/get_random_reading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failure.dart';
part 'magic_ball_state.dart';

class MagicBallCubit extends Cubit<MagicBallState> {
  final GetRandomReading randomReading;
  late bool speakVoice;
  FlutterTts flutterTts = FlutterTts();

  MagicBallCubit({required this.randomReading}) : super(MagicBallInitial());

  Future<void> getRandomReading() async {
    try {
      emit(MagicBallLoadingState());

      await Future.delayed(Duration(seconds: 2));
      final loadedReadingOrFailure = await randomReading(NoParams());
      loadedReadingOrFailure.fold(
          (error) => emit(MagicBallErrorState(
              error: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (readingEntitiy) async {
        await flutterTts.setLanguage('en-US');
        await flutterTts.setPitch(1.0);
        await flutterTts.speak(readingEntitiy.reading);
        emit(MagicBallLoadedState(reading: readingEntitiy.reading));
      });
    } catch (_) {}
  }
}
