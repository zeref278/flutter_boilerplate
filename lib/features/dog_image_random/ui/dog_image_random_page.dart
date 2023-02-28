import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplate/common/app_dimens.dart';
import 'package:boilerplate/common/app_spacing.dart';
import 'package:boilerplate/core/bloc_core/ui_status.dart';
import 'package:boilerplate/features/dog_image_random/bloc/dog_image_random_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImageRandomPage extends StatefulWidget {
  const DogImageRandomPage({Key? key}) : super(key: key);

  @override
  State<DogImageRandomPage> createState() => _DogImageRandomPageState();
}

class _DogImageRandomPageState extends State<DogImageRandomPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageRandomBloc>(
      create: (context) => Injector.instance<DogImageRandomBloc>()
        ..add(
          const DogImageRandomLoaded(),
        ),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
        bottomNavigationBar: _ButtonBar(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.current.dog_image_random),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<DogImageRandomBloc, DogImageRandomState>(
        listenWhen: (prev, next) => prev.notification != next.notification,
        listener: (context, state) {
          state.notification?.when(
            notifySuccess: (message) {
              Flushbar(
                message: state.errorMsg,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              ).show(context);
            },
            notifyFailed: (message) {
              Flushbar(
                message: state.successMsg,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
          );
        },
        buildWhen: (prev, next) => prev.status != next.status,
        builder: (context, state) {
          return state.status.when(
            onInitial: () {
              return Text(S.current.press_button);
            },
            onLoading: () {
              return const CircularProgressIndicator();
            },
            onLoadFailure: () {
              return Text(S.current.load_failed);
            },
            onLoadSuccess: () {
              return Image.network(state.dogImage.message);
            },
          );
        },
      ),
    );
  }
}

class _ButtonBar extends StatelessWidget {
  const _ButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.basePadding, vertical: AppDimens.basePadding),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text(S.current.load_image),
                onPressed: () {
                  final DogImageRandomBloc bloc =
                      context.read<DogImageRandomBloc>();
                  bloc.add(const DogImageRandomRandomRequested());
                },
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: ElevatedButton(
                child: Text(S.current.load_and_insert_db),
                onPressed: () {
                  final DogImageRandomBloc bloc =
                      context.read<DogImageRandomBloc>();
                  bloc.add(const DogImageRandomRandomRequested(insertDb: true));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
