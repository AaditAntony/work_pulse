import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/settings_model.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(
    SettingsState(
      settings: SettingsModel.initial(),
    ),
  ) {

    on<LunchTimeChanged>((event, emit) {

      emit(
        SettingsState(
          settings: state.settings.copyWith(
            lunchTime: event.lunchTime,
          ),
        ),
      );
    });

    on<ReminderIntervalChanged>((event, emit) {

      emit(
        SettingsState(
          settings: state.settings.copyWith(
            reminderInterval: event.interval,
          ),
        ),
      );
    });

    on<SoundToggled>((event, emit) {

      emit(
        SettingsState(
          settings: state.settings.copyWith(
            soundEnabled:
            !state.settings.soundEnabled,
          ),
        ),
      );
    });

    on<VibrationToggled>((event, emit) {

      emit(
        SettingsState(
          settings: state.settings.copyWith(
            vibrationEnabled:
            !state.settings.vibrationEnabled,
          ),
        ),
      );
    });
  }
}