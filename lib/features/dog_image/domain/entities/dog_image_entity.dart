import 'package:equatable/equatable.dart';

/// A dog image as the app understands it.
///
/// `status` from the API is transport metadata and deliberately absent. `id`
/// is null until the image has been saved.
class DogImageEntity extends Equatable {
  const DogImageEntity({required this.imageUrl, this.id});

  final int? id;
  final String imageUrl;

  DogImageEntity copyWith({int? id, String? imageUrl}) =>
      DogImageEntity(id: id ?? this.id, imageUrl: imageUrl ?? this.imageUrl);

  @override
  List<Object?> get props => <Object?>[id, imageUrl];
}
