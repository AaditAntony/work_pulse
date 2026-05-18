import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class OfficeInPressed extends AttendanceEvent {}

class LunchOutPressed extends AttendanceEvent {}

class LunchInPressed extends AttendanceEvent {}

class OfficeOutPressed extends AttendanceEvent {}

class ResetAttendancePressed extends AttendanceEvent {}
