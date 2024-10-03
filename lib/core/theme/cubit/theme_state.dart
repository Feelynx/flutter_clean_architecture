part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState(this.appSettings);

  final AppSettingsEntity appSettings;

  @override
  List<Object> get props => [appSettings];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.appSettings);
}

class ThemeLoaded extends ThemeState {
  const ThemeLoaded(super.appSettings);
}
