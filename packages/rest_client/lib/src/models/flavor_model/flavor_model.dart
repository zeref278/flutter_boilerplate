import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavor_model.freezed.dart';
part 'flavor_model.g.dart';

@Freezed(fromJson: true)
class FlavorModel with _$FlavorModel {
  const factory FlavorModel({
    required String flavor,
  }) = _FlavorModel;

  factory FlavorModel.fromJson(Map<String, dynamic> json) =>
      _$FlavorModelFromJson(json);
}
