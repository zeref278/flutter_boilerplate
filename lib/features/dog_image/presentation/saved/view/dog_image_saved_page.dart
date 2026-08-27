import 'dart:async';

import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/bloc/dog_image_saved_bloc.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/dog_image_saved_keys.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/widgets/dog_image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImageSavedPage extends StatelessWidget {
  const DogImageSavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageSavedBloc>(
      create: (_) =>
          Injector.instance<DogImageSavedBloc>()
            ..add(const DogImageSavedEvent.loadRequested()),
      child: BlocListener<DogImageSavedBloc, DogImageSavedState>(
        listenWhen: (previous, next) =>
            previous.notification != next.notification,
        listener: _onNotification,
        child: Scaffold(
          key: const Key(DogImageSavedKeys.scaffold),
          appBar: AppBar(title: Text(context.l10n.dogImageSavedTitle)),
          body: const _Body(),
        ),
      ),
    );
  }

  /// The bloc reports the outcome; this switch picks the widget for it. The
  /// union is sealed, so a new outcome fails to compile until it is presented.
  void _onNotification(BuildContext context, DogImageSavedState state) {
    final DogImageSavedNotification? notification = state.notification;
    if (notification == null) return;

    switch (notification) {
      case DogImageSavedNotificationFailed(:final failure):
        AppToast.show(context, failure.displayMessage(context));
      case DogImageSavedNotificationConfirmDelete(:final image):
        unawaited(_confirmDelete(context, image));
    }
  }

  /// A destructive action needs a real decision, not a toast. The dialog is
  /// awaited here, in the presentation layer, and its answer travels back as
  /// an event — a bloc never awaits a dialog and never holds a
  /// [BuildContext].
  Future<void> _confirmDelete(
    BuildContext context,
    DogImageEntity image,
  ) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        key: const Key(DogImageSavedKeys.deleteDialog),
        title: Text(dialogContext.l10n.dogImageSavedDeleteTitle),
        content: Text(dialogContext.l10n.dogImageSavedDeleteMessage),
        actions: <Widget>[
          TextButton(
            key: const Key(DogImageSavedKeys.deleteCancel),
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(dialogContext.l10n.actionCancel),
          ),
          TextButton(
            key: const Key(DogImageSavedKeys.deleteConfirm),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(dialogContext.l10n.actionDelete),
          ),
        ],
      ),
    );

    // The page can be popped while the dialog is open, so the context that
    // reads the bloc must be re-checked after the await.
    if (!context.mounted) return;
    if (confirmed ?? false) {
      context.read<DogImageSavedBloc>().add(
        DogImageSavedEvent.deleteConfirmed(image),
      );
    }
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogImageSavedBloc, DogImageSavedState>(
      builder: (context, state) {
        return switch (state.status) {
          UIInitial() ||
          UILoading() => const Center(child: CircularProgressIndicator()),
          UILoadFailed(:final failure) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(failure.displayMessage(context)),
                if (failure.isRetryable)
                  TextButton(
                    onPressed: () => context.read<DogImageSavedBloc>().add(
                      const DogImageSavedEvent.loadRequested(),
                    ),
                    child: Text(context.l10n.actionLoadImage),
                  ),
              ],
            ),
          ),
          UILoadSuccess() => ListView.builder(
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              final DogImageEntity image = state.images[index];
              return DogImageTile(
                key: Key('${DogImageSavedKeys.tile}.${image.id}'),
                image: image,
                onDelete: () => context.read<DogImageSavedBloc>().add(
                  DogImageSavedEvent.deleteRequested(image),
                ),
              );
            },
          ),
        };
      },
    );
  }
}
