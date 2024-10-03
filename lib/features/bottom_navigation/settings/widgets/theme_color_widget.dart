import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';
import 'package:flutter_clean_architecture/core/theme/const/theme_colors.dart';
import 'package:flutter_clean_architecture/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/settings/cubit/settings_cubit.dart';

class ThemeColorWidget extends StatefulWidget {
  const ThemeColorWidget({super.key});

  @override
  State<ThemeColorWidget> createState() => _ThemeColorWidgetState();
}

class _ThemeColorWidgetState extends State<ThemeColorWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(context.l10n.themeColor),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.themeColorMessage),
              const SizedBox(height: 8),
              NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  final settingsCubit = context.read<SettingsCubit>();
                  if (scrollNotification is ScrollStartNotification) {
                    settingsCubit.toggleHintVisibility();
                  } else if (scrollNotification is ScrollEndNotification) {
                    settingsCubit.toggleHintVisibility();
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: ToggleButtons(
                    isSelected: kThemeColors
                        .map((color) => color.value == context.read<ThemeCubit>().state.appSettings.color)
                        .toList(),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    onPressed: (index) {
                      context.read<ThemeCubit>().changeThemeColor(kThemeColors[index]);
                    },
                    renderBorder: false,
                    children: kThemeColors.map((color) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          titleTextStyle: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Visibility(
            visible: context.watch<SettingsCubit>().state.isHintVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                context.l10n.themeScrollMessage,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
