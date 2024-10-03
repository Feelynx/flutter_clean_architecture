import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/routes/go_router_config.dart';
import 'package:flutter_clean_architecture/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/core/theme/cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(appSettingsUseCases),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: FocusManager.instance.primaryFocus?.unfocus,
            child: MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: AppTheme.fromBrightness(
                brightness: Brightness.light,
                seedColor: state.appSettings.colorEnum,
              ).toThemeData(),
              darkTheme: AppTheme.fromBrightness(
                brightness: Brightness.dark,
                seedColor: state.appSettings.colorEnum,
              ).toThemeData(),
              themeMode: state.appSettings.themeModeEnum,
              routerConfig: goRouter,
            ),
          );
        },
      ),
    );
  }
}
