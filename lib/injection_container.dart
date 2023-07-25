import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:magic_ball/features/magic_ball/data/datasources/reading_remote_data_sourse.dart';
import 'package:magic_ball/features/magic_ball/data/repositories/reading_repository_impl.dart';
import 'package:magic_ball/features/magic_ball/domain/repositories/reading_repository.dart';
import 'package:magic_ball/features/magic_ball/domain/usecases/get_random_reading.dart';
import 'package:magic_ball/features/magic_ball/presentation/cubit/magic_ball_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';
import 'features/magic_ball/data/datasources/reading_local_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => MagicBallCubit(
      randomReading: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetRandomReading(sl()));

  // Repository
  sl.registerLazySingleton<ReadingRepository>(
    () => ReadingRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ReadingRemoteDataSource>(
    () => ReadingRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<ReadingLocalDataSource>(
    () => ReadingLocalDataSorceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

void initFeatures() {}
