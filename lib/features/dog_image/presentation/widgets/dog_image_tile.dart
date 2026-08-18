import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:flutter/material.dart';

class DogImageTile extends StatelessWidget {
  const DogImageTile({required this.image, required this.onDelete, super.key});

  final DogImageEntity image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image.imageUrl, width: 56, fit: BoxFit.cover),
      title: Text(image.imageUrl, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: onDelete,
      ),
    );
  }
}
