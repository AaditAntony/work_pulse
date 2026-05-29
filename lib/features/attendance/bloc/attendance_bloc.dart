import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../models/punch_model.dart';
import 'attendance_event.dart';
import 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  static AttendanceStatus _restoreStatus(
      List<PunchModel> punches,
      ) {

    if (punches.isEmpty) {
      return AttendanceStatus.initial;
    }

    final lastPunch = punches.last.title;

    switch (lastPunch) {

      case 'Office IN':
        return AttendanceStatus.officeInCompleted;

      case 'Lunch OUT':
        return AttendanceStatus.lunchOutCompleted;

      case 'Lunch IN':
        return AttendanceStatus.lunchInCompleted;

      case 'Office OUT':
        return AttendanceStatus.officeOutCompleted;

      default:
        return AttendanceStatus.initial;
    }
  }
  AttendanceBloc()
      : super(
    AttendanceState(
      punches: Hive.box<PunchModel>('attendanceBox')
          .values
          .toList(),

      status: _restoreStatus(
        Hive.box<PunchModel>('attendanceBox')
            .values
            .toList(),
      ),
    ),
  ) {
    on<OfficeInPressed>((event, emit) {
      if (state.status == AttendanceStatus.initial) {
        final updatedPunches = List<PunchModel>.from(state.punches)
          ..add(PunchModel(title: 'Office IN', time: DateTime.now()));
        Hive.box<PunchModel>('attendanceBox').add(updatedPunches.last);
        emit(
          state.copyWith(
            status: AttendanceStatus.officeInCompleted,
            punches: updatedPunches,
          ),
        );
      }
    });

    on<LunchOutPressed>((event, emit) {
      if (state.status == AttendanceStatus.officeInCompleted) {
        final updatedPunches = List<PunchModel>.from(state.punches)
          ..add(PunchModel(title: 'Lunch OUT', time: DateTime.now()));
        Hive.box<PunchModel>('attendanceBox').add(updatedPunches.last);
        emit(
          state.copyWith(
            status: AttendanceStatus.lunchOutCompleted,
            punches: updatedPunches,
          ),
        );
      }
    });

    on<LunchInPressed>((event, emit) {
      if (state.status == AttendanceStatus.lunchOutCompleted) {
        final updatedPunches = List<PunchModel>.from(state.punches)
          ..add(PunchModel(title: 'Lunch IN', time: DateTime.now()));
        Hive.box<PunchModel>('attendanceBox').add(updatedPunches.last);
        emit(
          state.copyWith(
            status: AttendanceStatus.lunchInCompleted,
            punches: updatedPunches,
          ),
        );
      }
    });

    on<OfficeOutPressed>((event, emit) {
      if (state.status == AttendanceStatus.lunchInCompleted) {
        final updatedPunches = List<PunchModel>.from(state.punches)
          ..add(PunchModel(title: 'Office OUT', time: DateTime.now()));
        Hive.box<PunchModel>('attendanceBox').add(updatedPunches.last);
        emit(
          state.copyWith(
            status: AttendanceStatus.officeOutCompleted,
            punches: updatedPunches,
          ),
        );
      }
    });

    on<ResetAttendancePressed>((event, emit) {

      Hive.box<PunchModel>('attendanceBox').clear();

      emit(
        const AttendanceState(),
      );
    });
  }
}
