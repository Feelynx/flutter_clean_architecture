part of 'settings_cubit.dart';

sealed class SettingsState {
  final bool isHintVisible;

  const SettingsState({required this.isHintVisible});
}

class SettingsInitial extends SettingsState {
  SettingsInitial({required super.isHintVisible});
}

class SettingsChanged extends SettingsState {
  SettingsChanged({required super.isHintVisible});
}
