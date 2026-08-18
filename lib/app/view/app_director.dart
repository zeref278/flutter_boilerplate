import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/features/home/presentation/page/home_page.dart';
import 'package:boilerplate/features/intro/presentation/page/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Chooses the first screen based on whether this is a first launch.
class AppDirector extends StatelessWidget {
  const AppDirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (prev, next) => prev.isFirstUse != next.isFirstUse,
      builder: (context, state) =>
          state.isFirstUse ? const IntroPage() : const HomePage(),
    );
  }
}
