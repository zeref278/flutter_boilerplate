import 'package:boilerplate/core/dimens/app_dimens.dart';
import 'package:boilerplate/core/spacings/app_spacing.dart';
import 'package:boilerplate/generated/assets.gen.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.assets),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.basePadding),
        child: Column(
          children: [
            const Text('svg'),
            AppSpacing.verticalSpacing24,
            Assets.icons.iconAstronomy.svg(),
            AppSpacing.verticalSpacing24,
            const Text('png'),
            Assets.images.imageDog.image(),
            AppSpacing.verticalSpacing24,
          ],
        ),
      ),
    );
  }
}
