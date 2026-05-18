import 'package:equatable/equatable.dart';

enum AttendanceStatus {
  initial,
  officeInCompleted,
  lunchOutCompleted,
  lunchInCompleted,
  officeOutCompleted,
}

class AttendanceState extends Equatable {
  final AttendanceStatus status;

  const AttendanceState({this.status = AttendanceStatus.initial});

  AttendanceState copyWith({AttendanceStatus? status}) {
    return AttendanceState(status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
