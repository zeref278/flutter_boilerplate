import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/ui/app_dimens.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).setting)),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.basePadding),
        child: Column(
          children: <Widget>[
            const _LocaleSelector(),
            const Divider(),
            const _DarkModeSwitch(),
          ],
        ),
      ),
    );
  }
}

class _LocaleSelector extends StatelessWidget {
  const _LocaleSelector();

  @override
  Widget build(BuildContext context) {
    final String locale = context.select((AppBloc bloc) => bloc.state.locale);

    return Column(
      children: AppConfig.supportedLocales.map((code) {
        return RadioListTile<String>(
          value: code,
          groupValue: locale,
          onChanged: (value) {
            if (value == null) return;
            context.read<AppBloc>().add(AppEvent.localeChanged(value));
          },
          title: Text(
            code == 'en' ? S.of(context).english : S.of(context).vietnamese,
          ),
        );
      }).toList(),
    );
  }
}

class _DarkModeSwitch extends StatelessWidget {
  const _DarkModeSwitch();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.select(
      (AppBloc bloc) => bloc.state.isDarkMode,
    );

    return SwitchListTile(
      value: isDarkMode,
      onChanged: (_) =>
          context.read<AppBloc>().add(const AppEvent.darkModeToggled()),
      title: Text(S.of(context).dark_mode),
    );
  }
}
