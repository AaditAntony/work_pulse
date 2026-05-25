import 'package:equatable/equatable.dart';
import 'package:work_pulse/features/attendance/models/punch_model.dart';

enum AttendanceStatus {
  initial,
  officeInCompleted,
  lunchOutCompleted,
  lunchInCompleted,
  officeOutCompleted,
}

class AttendanceState extends Equatable {
  final AttendanceStatus status;
  final List<PunchModel> punches;

  const AttendanceState({
    this.status = AttendanceStatus.initial,
    this.punches = const [],
  });

  AttendanceState copyWith({
    AttendanceStatus? status,
    List<PunchModel>? punches,
  }) {
    return AttendanceState(
      status: status ?? this.status,
      punches: punches ?? this.punches,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, punches];
}
