import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          key: const Key(WidgetKeys.introStartedButtonKey),
          onPressed: () =>
              context.read<AppBloc>().add(const AppEvent.firstUseCompleted()),
          child: Text(S.of(context).get_started),
        ),
      ),
    );
  }
}
