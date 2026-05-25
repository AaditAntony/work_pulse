import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/punch_model.dart';
import 'attendance_event.dart';
import 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(const AttendanceState()) {

    on<OfficeInPressed>((event, emit) {

      if (state.status == AttendanceStatus.initial) {

        final updatedPunches = List<PunchModel>.from(state.punches)
          ..add(
            PunchModel(
              title: 'Office IN',
              time: DateTime.now(),
            ),
          );

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
          ..add(
            PunchModel(
              title: 'Lunch OUT',
              time: DateTime.now(),
            ),
          );

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
          ..add(
            PunchModel(
              title: 'Lunch IN',
              time: DateTime.now(),
            ),
          );

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
          ..add(
            PunchModel(
              title: 'Office OUT',
              time: DateTime.now(),
            ),
          );

        emit(
          state.copyWith(
            status: AttendanceStatus.officeOutCompleted,
            punches: updatedPunches,
          ),
        );
      }
    });

    on<ResetAttendancePressed>((event, emit) {

      emit(
        const AttendanceState(),
      );
    });
  }
}