import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingTitle)),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.space8),
        child: Column(
          children: <Widget>[_LocaleSelector(), Divider(), _DarkModeSwitch()],
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

    // The selection lives on the group rather than on each tile: per-tile
    // groupValue/onChanged were deprecated after Flutter 3.32.
    return RadioGroup<String>(
      groupValue: locale,
      onChanged: (value) {
        if (value == null) return;
        context.read<AppBloc>().add(AppEvent.localeChanged(value));
      },
      child: Column(
        children: AppConfig.supportedLocales.map((code) {
          return RadioListTile<String>(
            value: code,
            title: Text(
              code == 'en'
                  ? context.l10n.settingEnglish
                  : context.l10n.settingVietnamese,
            ),
          );
        }).toList(),
      ),
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
      title: Text(context.l10n.settingDarkMode),
    );
  }
}
