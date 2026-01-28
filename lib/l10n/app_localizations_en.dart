// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get requiredField => 'Required field';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get genericErrorTitle => 'Generic error';

  @override
  String get genericErrorMessage => 'An error occurred';

  @override
  String get close => 'Close';

  @override
  String get retry => 'Retry';

  @override
  String get login_error => 'Error during login';

  @override
  String get theme => 'Theme';

  @override
  String get themeMessage => 'Select theme';

  @override
  String get logout => 'Logout';

  @override
  String get logoutMessage => 'Disconnect the current user';

  @override
  String get contacts => 'Contacts';

  @override
  String welcome(Object name) {
    return 'Welcome $name';
  }

  @override
  String get themeColor => 'Theme color';

  @override
  String get themeColorMessage => 'Select the theme color';

  @override
  String get themeScrollMessage => 'Scroll horizontally to navigate colors\nTap to select';
}
