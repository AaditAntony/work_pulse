import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_pulse/features/attendance/bloc/attendance_event.dart';
import 'package:work_pulse/features/attendance/bloc/attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(const AttendanceState()) {
    on<OfficeInPressed>((event, emit) {
      state.copyWith(status: AttendanceStatus.officeInCompleted);
    });
    on<LunchOutPressed>((event, emit) {
      emit(state.copyWith(status: AttendanceStatus.lunchOutCompleted));
    });
  }
}
