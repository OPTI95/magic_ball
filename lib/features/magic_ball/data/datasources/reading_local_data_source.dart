import 'package:magic_ball/features/magic_ball/data/models/random_reading_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeption.dart';

const CACHED_READING = 'CACHED_READING';

abstract class ReadingLocalDataSource {
  Future<RandomReadingModel> getLastRandomReading();
  Future<void> cacheRandomReading(RandomReadingModel readingToCache);
}

class ReadingLocalDataSorceImpl implements ReadingLocalDataSource {
  final SharedPreferences sharedPreferences;

  ReadingLocalDataSorceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheRandomReading(RandomReadingModel readingToCache) {
    return sharedPreferences.setString(
      CACHED_READING,
      json.encode(readingToCache.toJson()),
    );
  }

  @override
  Future<RandomReadingModel> getLastRandomReading() {
final jsonString = sharedPreferences.getString(CACHED_READING);
    if (jsonString != null) {
      return Future.value(RandomReadingModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
