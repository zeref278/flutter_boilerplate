import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/dog_image/presentation/random/bloc/dog_image_random_bloc.dart';
import 'package:boilerplate/features/dog_image/presentation/random/dog_image_random_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImageRandomPage extends StatelessWidget {
  const DogImageRandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageRandomBloc>(
      create: (_) => Injector.instance<DogImageRandomBloc>(),
      child: Scaffold(
        key: const Key(DogImageRandomKeys.scaffold),
        appBar: AppBar(title: Text(context.l10n.dogImageRandomTitle)),
        body: const _Body(),
        bottomNavigationBar: const _Actions(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<DogImageRandomBloc, DogImageRandomState>(
        listenWhen: (prev, next) => prev.notification != next.notification,
        listener: (context, state) {
          final DogImageRandomNotification? notification = state.notification;
          if (notification == null) return;
          switch (notification) {
            case DogImageRandomNotificationFailed(:final failure):
              Flushbar<void>(
                message: failure.displayMessage(context),
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
              ).show(context);
          }
        },
        buildWhen: (prev, next) =>
            prev.status != next.status ||
            prev.isBusy != next.isBusy ||
            prev.dogImage != next.dogImage,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (state.dogImage == null)
                Text(context.l10n.dogImageRandomEmpty)
              else
                Image.network(
                  state.dogImage!.imageUrl,
                  key: const Key(DogImageRandomKeys.result),
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image_outlined),
                ),
              if (state.isBusy) const CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                key: const Key(DogImageRandomKeys.loadButton),
                onPressed: () => context.read<DogImageRandomBloc>().add(
                  const DogImageRandomEvent.randomRequested(),
                ),
                child: Text(context.l10n.actionLoadImage),
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: ElevatedButton(
                key: const Key(DogImageRandomKeys.saveButton),
                onPressed: () => context.read<DogImageRandomBloc>().add(
                  const DogImageRandomEvent.randomRequested(shouldSave: true),
                ),
                child: Text(context.l10n.dogImageRandomLoadAndSave),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
