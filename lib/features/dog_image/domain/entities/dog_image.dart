/// A dog image as the app understands it.
///
/// `status` from the API is transport metadata and deliberately absent. `id`
/// is null until the image has been saved.
class DogImage {
  const DogImage({required this.imageUrl, this.id});

  final int? id;
  final String imageUrl;

  DogImage copyWith({int? id, String? imageUrl}) =>
      DogImage(id: id ?? this.id, imageUrl: imageUrl ?? this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogImage && other.id == id && other.imageUrl == imageUrl;

  @override
  int get hashCode => Object.hash(id, imageUrl);

  @override
  String toString() => 'DogImage(id: $id, imageUrl: $imageUrl)';
}
