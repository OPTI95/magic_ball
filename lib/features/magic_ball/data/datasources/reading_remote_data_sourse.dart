import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/exeption.dart';
import '../models/random_reading_model.dart';

abstract class ReadingRemoteDataSource {
  /// Calls the https://www.eightballapi.com/api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<RandomReadingModel> getRandomReading();
}

class ReadingRemoteDataSourceImpl implements ReadingRemoteDataSource {
  final http.Client client;

  ReadingRemoteDataSourceImpl({required this.client});

  @override
  Future<RandomReadingModel> getRandomReading() async {
    final String url = "https://www.eightballapi.com/api";
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return RandomReadingModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
