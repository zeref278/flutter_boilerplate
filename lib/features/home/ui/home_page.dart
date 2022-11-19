import 'package:boilerplate/common/app_spacing.dart';
import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/features/home/bloc/home_bloc.dart';
import 'package:boilerplate/generated/assets.gen.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => Injector.instance<HomeBloc>()
        ..add(
          const HomeLoaded(),
        ),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flavor'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, cur) => prev.status != cur.status,
      builder: (context, state) {
        return state.status.when(
          onLoading: () {
            return const CircularProgressIndicator();
          },
          onLoadFailed: () {
            return const _ErrorWidget();
          },
          onLoadSuccess: () {
            return const _BodyContent();
          },
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, cur) => prev.successMessage != cur.successMessage,
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Text(
                state.successMessage ?? 'Missing message',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              AppSpacing.verticalSpacing32,
              ElevatedButton(
                onPressed: () {
                  FirebaseCrashlytics.instance.crash();
                },
                child: const Text('Crash'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.icons.iconError.svg(width: 200, height: 200),
    );
  }
}
