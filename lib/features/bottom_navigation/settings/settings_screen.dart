import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<ThemeMode>(
        onChanged: context.read<ThemeCubit>().changeMode,
        value: context.watch<ThemeCubit>().state,
        items: [
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(context.l10n.light),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(context.l10n.dark),
          ),
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(context.l10n.system),
          ),
        ],
      ),
    );
  }
}
