import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/intro/presentation/intro_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          key: const Key(IntroKeys.startedButton),
          onPressed: () =>
              context.read<AppBloc>().add(const AppEvent.firstUseCompleted()),
          child: Text(context.l10n.introGetStarted),
        ),
      ),
    );
  }
}
