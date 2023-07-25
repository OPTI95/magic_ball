import 'package:dartz/dartz.dart';

import 'package:magic_ball/core/error/failure.dart';

import 'package:magic_ball/features/magic_ball/domain/entities/random_reading_entity.dart';

import '../../../../core/error/exeption.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/reading_repository.dart';
import '../datasources/reading_local_data_source.dart';
import '../datasources/reading_remote_data_sourse.dart';

class ReadingRepositoryImpl extends ReadingRepository {
  final NetworkInfo networkInfo;
  final ReadingRemoteDataSource remoteDataSource;
  final ReadingLocalDataSource localDataSource;

  ReadingRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, RandomReadingEntity>> getRandomReading() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.getRandomReading();
        await localDataSource.cacheRandomReading(remoteWeather);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getLastRandomReading();
        return Right(localWeather);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
