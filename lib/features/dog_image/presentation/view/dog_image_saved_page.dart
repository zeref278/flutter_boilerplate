import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/errors/failure_x.dart';
import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_notification.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_saved_bloc.dart';
import 'package:boilerplate/features/dog_image/presentation/widgets/dog_image_tile.dart';
import 'package:boilerplate/generated/l10n.dart';
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
        listener: (context, state) {
          final notification = state.notification;
          if (notification case DogImageNotificationFailed(:final failure)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(failure.displayMessage(context))),
              );
          }
        },
        child: Scaffold(
          key: const Key(WidgetKeys.savedImagesScaffoldKey),
          appBar: AppBar(title: Text(S.of(context).image_from_db)),
          body: const _Body(),
        ),
      ),
    );
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
                    child: Text(S.of(context).load_image),
                  ),
              ],
            ),
          ),
          UILoadSuccess() => ListView.builder(
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              final DogImageEntity image = state.images[index];
              return DogImageTile(
                key: Key('${WidgetKeys.savedImageTileKey}.${image.id}'),
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
