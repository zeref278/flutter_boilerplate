import 'package:boilerplate/config/routes/app_router.dart';
import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:boilerplate/core/ui/app_spacing.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(WidgetKeys.homeScaffoldKey),
      appBar: AppBar(title: Text(S.of(context).home)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key(WidgetKeys.homeDogImageButtonKey),
              onPressed: () => context.push(AppRouter.dogImageRandomPath),
              child: Text(S.of(context).dog_image_random),
            ),
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              key: const Key(WidgetKeys.homeSavedImagesButtonKey),
              onPressed: () => context.push(AppRouter.savedImagesPath),
              child: Text(S.of(context).image_from_db),
            ),
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              key: const Key(WidgetKeys.homeSettingButtonKey),
              onPressed: () => context.push(AppRouter.settingPath),
              child: Text(S.of(context).setting),
            ),
          ],
        ),
      ),
    );
  }
}
