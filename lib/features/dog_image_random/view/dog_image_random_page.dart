import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplate/core/dimens/app_dimens.dart';
import 'package:boilerplate/core/spacings/app_spacing.dart';
import 'package:boilerplate/features/dog_image_random/bloc/dog_image_random_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:boilerplate/widgets/error_page.dart';
import 'package:boilerplate/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImageRandomPage extends StatefulWidget {
  const DogImageRandomPage({super.key});

  @override
  State<DogImageRandomPage> createState() => _DogImageRandomPageState();
}

class _DogImageRandomPageState extends State<DogImageRandomPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageRandomBloc>(
      create: (context) => Injector.instance<DogImageRandomBloc>(),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
        bottomNavigationBar: _ButtonBar(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.current.dog_image_random),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<DogImageRandomBloc, DogImageRandomState>(
        listenWhen: (prev, next) => prev.notification != next.notification,
        listener: (context, state) {
          state.notification?.when(
            notifySuccess: (message) {
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
            notifyFailed: (message) {
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              ).show(context);
            },
          );
        },
        buildWhen: (prev, next) =>
            prev.status != next.status || prev.isBusy != next.isBusy,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              state.status.when<Widget>(
                initial: () {
                  return Text(S.current.press_button);
                },
                loading: () {
                  return const LoadingPage();
                },
                loadFailed: (message) {
                  return ErrorPage(
                    content: message,
                  );
                },
                loadSuccess: (message) {
                  return Image.network(state.dogImage.message);
                },
              ),
              if (state.isBusy) const LoadingPage(),
            ],
          );
        },
      ),
    );
  }
}

class _ButtonBar extends StatelessWidget {
  const _ButtonBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.basePadding,
          vertical: AppDimens.basePadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text(S.current.load_image),
                onPressed: () {
                  context
                      .read<DogImageRandomBloc>()
                      .add(const DogImageRandomEvent.randomRequested());
                },
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: ElevatedButton(
                child: Text(S.current.load_and_insert_db),
                onPressed: () {
                  context.read<DogImageRandomBloc>().add(
                        const DogImageRandomEvent.randomRequested(
                          insertDb: true,
                        ),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
