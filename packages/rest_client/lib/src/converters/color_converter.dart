import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Convert json to color and vice versa
class ColorConverter implements JsonConverter<Color, String> {
  ///
  const ColorConverter();

  @override
  Color fromJson(String json) => Color(int.parse(json));

  @override
  String toJson(Color color) => color.value.toRadixString(16);
}

/// How to use JsonConverter for special property
// @Freezed(fromJson: true)
// @ColorConverter()
// class DogImage with _$DogImage {
//   const factory DogImage({
//     required String message,
//     required String status,
//     @ColorConverter()
//     required Color color,
//   }) = _DogImage;
//
//   factory DogImage.fromJson(Map<String, dynamic> json) =>
//       _$DogImageFromJson(json);
// }
