import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}
