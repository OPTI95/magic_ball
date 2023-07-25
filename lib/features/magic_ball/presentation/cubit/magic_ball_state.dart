part of 'magic_ball_cubit.dart';

abstract class MagicBallState extends Equatable {
  const MagicBallState();

  @override
  List<Object> get props => [];
}

class MagicBallInitial extends MagicBallState {}

class MagicBallLoadingState extends MagicBallState{}
class MagicBallLoadedState extends MagicBallState{
  final String reading;

  const MagicBallLoadedState({required this.reading});
}
class MagicBallErrorState extends MagicBallState{
  final String error;

  const MagicBallErrorState({ required this.error});
}
