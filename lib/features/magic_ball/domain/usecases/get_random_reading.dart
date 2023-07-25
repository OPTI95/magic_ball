import 'package:dartz/dartz.dart';
import 'package:magic_ball/core/error/failure.dart';
import 'package:magic_ball/core/usecases/usecase.dart';
import 'package:magic_ball/features/magic_ball/domain/entities/random_reading_entity.dart';
import 'package:magic_ball/features/magic_ball/domain/repositories/reading_repository.dart';

class GetRandomReading extends UseCase<RandomReadingEntity, NoParams> {
  final ReadingRepository repository;
  GetRandomReading(this.repository);
  @override
  Future<Either<Failure, RandomReadingEntity>> call(NoParams params) async {
    return await repository.getRandomReading();
  }
}
