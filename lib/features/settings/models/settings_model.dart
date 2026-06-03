class SettingsModel {
  final String lunchTime;
  final int reminderInterval;
  final bool soundEnabled;
  final bool vibrationEnabled;

  const SettingsModel({
    required this.lunchTime,
    required this.reminderInterval,
    required this.soundEnabled,
    required this.vibrationEnabled,
  });

  factory SettingsModel.initial() {
    return const SettingsModel(
      lunchTime: '13:00',
      reminderInterval: 5,
      soundEnabled: true,
      vibrationEnabled: true,
    );
  }

  SettingsModel copyWith({
    String? lunchTime,
    int? reminderInterval,
    bool? soundEnabled,
    bool? vibrationEnabled,
  }) {
    return SettingsModel(
      lunchTime: lunchTime ?? this.lunchTime,
      reminderInterval:
      reminderInterval ?? this.reminderInterval,
      soundEnabled:
      soundEnabled ?? this.soundEnabled,
      vibrationEnabled:
      vibrationEnabled ?? this.vibrationEnabled,
    );
  }
}