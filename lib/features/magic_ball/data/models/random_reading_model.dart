import 'package:magic_ball/features/magic_ball/domain/entities/random_reading_entity.dart';

class RandomReadingModel extends RandomReadingEntity {
  RandomReadingModel({required super.reading});
  factory RandomReadingModel.fromJson(Map<String, dynamic> json) {
    return RandomReadingModel(
      reading: json['reading'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'reading': reading,
    };
  }
}
