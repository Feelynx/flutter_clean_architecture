import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';
import 'package:flutter_clean_architecture/core/theme/cubit/theme_cubit.dart';

class ThemeModeWidget extends StatelessWidget {
  const ThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(context.l10n.theme),
      subtitle: Text(context.l10n.themeMessage),
      titleTextStyle: context.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      trailing: ToggleButtons(
        isSelected:
            ThemeMode.values.map((mode) => mode == context.read<ThemeCubit>().state.appSettings.themeModeEnum).toList(),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onPressed: (index) {
          context.read<ThemeCubit>().changeThemeMode(ThemeMode.values[index]);
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
    );
  }
}
