import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplate/common/app_spacing.dart';
import 'package:boilerplate/features/demo/bloc/demo_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:boilerplate/widgets/error_page.dart';
import 'package:boilerplate/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_client/rest_client.dart';

class ImagesFromDbPage extends StatelessWidget {
  const ImagesFromDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DemoBloc>(
      create: (context) => Injector.instance<DemoBloc>()
        ..add(
          const DemoEvent.loadImageFromDB(),
        ),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.current.image_from_db),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DemoBloc, DemoState>(
        listenWhen: (prev, next) => prev.status != next.status,
        listener: (context, state) {
          state.notification?.when(
            insertSuccess: (message) {
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
            insertFailed: (message) {
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
          return state.status.when<Widget>(
            initial: () {
              return const LoadingPage();
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
              return Stack(
                children: [
                  _buildImages(state.images),
                  if (state.isBusy) const LoadingPage(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildImages(List<DogImage> images) {
    return ListView.separated(
      itemBuilder: (context, index) => Stack(
        children: [
          Image.network(images[index].message),
          Positioned(
            child: InkWell(
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onTap: () {
                final DemoBloc demoBloc = context.read<DemoBloc>();
                demoBloc.add(
                  DemoEvent.deleteImageFromDB(
                    message: images[index].message,
                  ),
                );
              },
            ),
          )
        ],
      ),
      separatorBuilder: (context, index) => AppSpacing.verticalSpacing6,
      itemCount: images.length,
    );
  }
}
