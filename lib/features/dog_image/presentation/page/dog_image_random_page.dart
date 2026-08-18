import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/errors/failure_x.dart';
import 'package:boilerplate/core/ui/app_dimens.dart';
import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:boilerplate/core/ui/app_spacing.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_notification.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_random_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImageRandomPage extends StatelessWidget {
  const DogImageRandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageRandomBloc>(
      create: (_) => Injector.instance<DogImageRandomBloc>(),
      child: Scaffold(
        key: const Key(WidgetKeys.dogImageScaffoldKey),
        appBar: AppBar(title: Text(S.of(context).dog_image_random)),
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
          final DogImageNotification? notification = state.notification;
          if (notification == null) return;
          final String message = switch (notification) {
            DogImageNotificationSucceeded(:final message) => message,
            DogImageNotificationFailed(:final failure) =>
              failure.displayMessage(context),
          };
          Flushbar<void>(
            message: message,
            duration: const Duration(seconds: 2),
            backgroundColor: notification is DogImageNotificationFailed
                ? Colors.red
                : Colors.green,
          ).show(context);
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
                Text(S.of(context).press_button)
              else
                Image.network(
                  state.dogImage!.imageUrl,
                  key: const Key(WidgetKeys.dogImageResultKey),
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
        padding: const EdgeInsets.all(AppDimens.basePadding),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                key: const Key(WidgetKeys.dogImageLoadButtonKey),
                onPressed: () => context.read<DogImageRandomBloc>().add(
                  const DogImageRandomEvent.randomRequested(),
                ),
                child: Text(S.of(context).load_image),
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: ElevatedButton(
                key: const Key(WidgetKeys.dogImageSaveButtonKey),
                onPressed: () => context.read<DogImageRandomBloc>().add(
                  const DogImageRandomEvent.randomRequested(saveToDb: true),
                ),
                child: Text(S.of(context).load_and_insert_db),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
