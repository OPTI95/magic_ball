import 'package:equatable/equatable.dart';

class RandomReadingEntity extends Equatable {
  final String reading;

  const RandomReadingEntity({required this.reading});

  @override
  List<Object?> get props => [reading];
}
