import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/settings/widgets/logout_widget.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/settings/widgets/theme_color_widget.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/settings/widgets/theme_mode_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ThemeModeWidget(),
            Divider(),
            ThemeColorWidget(),
            Divider(),
            LogoutWidget(),
          ],
        ),
      ),
    );
  }
}
