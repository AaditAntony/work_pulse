import 'package:equatable/equatable.dart';

import '../models/settings_model.dart';

class SettingsState extends Equatable {
  final SettingsModel settings;

  const SettingsState({
    required this.settings,
  });

  @override
  List<Object?> get props => [settings];
}