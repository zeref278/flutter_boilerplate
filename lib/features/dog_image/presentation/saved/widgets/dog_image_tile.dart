import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/dog_image_saved_keys.dart';
import 'package:flutter/material.dart';

class DogImageTile extends StatelessWidget {
  const DogImageTile({required this.image, required this.onDelete, super.key});

  final DogImageEntity image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        image.imageUrl,
        width: 56,
        fit: BoxFit.cover,
        // A stored URL can rot. Without this the tile renders Flutter's
        // broken-image box and the load error escapes to the zone handler.
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image_outlined),
      ),
      title: Text(image.imageUrl, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: IconButton(
        key: Key('${DogImageSavedKeys.deleteButton}.${image.id}'),
        icon: const Icon(Icons.delete_outline),
        onPressed: onDelete,
      ),
    );
  }
}
