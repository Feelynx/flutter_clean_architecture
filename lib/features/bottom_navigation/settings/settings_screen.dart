import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(context.l10n.theme),
              subtitle: Text(context.l10n.themeMessage),
              titleTextStyle: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              trailing: ToggleButtons(
                isSelected: [
                  context.watch<ThemeCubit>().state == ThemeMode.system,
                  context.watch<ThemeCubit>().state == ThemeMode.light,
                  context.watch<ThemeCubit>().state == ThemeMode.dark,
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                onPressed: (index) {
                  context.read<ThemeCubit>().changeMode(ThemeMode.values[index]);
                },
                textStyle: context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.contrast),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.light_mode_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.dark_mode_outlined),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(context.l10n.logout),
              subtitle: Text(context.l10n.logoutMessage),
              trailing: const Icon(Icons.logout),
              onTap: () => authNotifier.doLogout(),
            ),
          ],
        ),
      ),
    );
  }
}
