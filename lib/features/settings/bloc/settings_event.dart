import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LunchTimeChanged extends SettingsEvent {
  final String lunchTime;

  const LunchTimeChanged(this.lunchTime);

  @override
  List<Object?> get props => [lunchTime];
}

class ReminderIntervalChanged extends SettingsEvent {
  final int interval;

  const ReminderIntervalChanged(this.interval);

  @override
  List<Object?> get props => [interval];
}

class SoundToggled extends SettingsEvent {}

class VibrationToggled extends SettingsEvent {}
//ok