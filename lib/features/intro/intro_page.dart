import 'package:boilerplate/core/keys/app_keys.dart';
import 'package:boilerplate/core/spacings/app_spacing.dart';
import 'package:boilerplate/features/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Intro'),
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              key: const Key(WidgetKeys.introStartedButtonKey),
              onPressed: () {
                context.read<AppBloc>().add(const AppEvent.disableFirstUse());
              },
              child: const Text('Started'),
            ),
          ],
        ),
      ),
    );
  }
}
