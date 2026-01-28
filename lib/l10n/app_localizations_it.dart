// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get requiredField => 'Campo obbligatorio';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profilo';

  @override
  String get settings => 'Impostazioni';

  @override
  String get light => 'Chiaro';

  @override
  String get dark => 'Scuro';

  @override
  String get system => 'Sistema';

  @override
  String get genericErrorTitle => 'Errore generico';

  @override
  String get genericErrorMessage => 'Si è verificato un errore';

  @override
  String get close => 'Chiudi';

  @override
  String get retry => 'Riprova';

  @override
  String get login_error => 'Errore durante il login';

  @override
  String get theme => 'Tema';

  @override
  String get themeMessage => 'Seleziona il tema';

  @override
  String get logout => 'Logout';

  @override
  String get logoutMessage => 'Disconnetti l\'utente corrente';

  @override
  String get contacts => 'Contatti';

  @override
  String welcome(Object name) {
    return 'Benvenuto $name';
  }

  @override
  String get themeColor => 'Colore del tema';

  @override
  String get themeColorMessage => 'Seleziona il colore del tema';

  @override
  String get themeScrollMessage => 'Scorri orizzontalmente per navigare tra i colori\nTocca per selezionare';
}
