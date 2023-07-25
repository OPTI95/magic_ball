import 'package:dartz/dartz.dart';
import 'package:magic_ball/core/error/failure.dart';
import 'package:magic_ball/features/magic_ball/domain/entities/random_reading_entity.dart';

abstract class ReadingRepository {
  Future<Either<Failure, RandomReadingEntity>> getRandomReading();
}
