import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_image_model.freezed.dart';
part 'dog_image_model.g.dart';

/// Exactly the dog.ceo response shape. Never leaves the data layer.
@freezed
abstract class DogImageModel with _$DogImageModel {
  const factory DogImageModel({
    required String message,
    required String status,
  }) = _DogImageModel;

  factory DogImageModel.fromJson(Map<String, dynamic> json) =>
      _$DogImageModelFromJson(json);
}
