import 'package:boilerplate/config/routes/app_router.dart';
import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/home/presentation/home_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(HomeKeys.scaffold),
      appBar: AppBar(title: Text(context.l10n.homeTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key(HomeKeys.dogImageRandomButton),
              onPressed: () => context.push(AppRouter.dogImageRandomPath),
              child: Text(context.l10n.dogImageRandomTitle),
            ),
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              key: const Key(HomeKeys.dogImageSavedButton),
              onPressed: () => context.push(AppRouter.dogImageSavedPath),
              child: Text(context.l10n.dogImageSavedTitle),
            ),
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              key: const Key(HomeKeys.settingButton),
              onPressed: () => context.push(AppRouter.settingPath),
              child: Text(context.l10n.settingTitle),
            ),
          ],
        ),
      ),
    );
  }
}
