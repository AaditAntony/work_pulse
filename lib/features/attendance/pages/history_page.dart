import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/attendance_bloc.dart';
import '../bloc/attendance_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
      ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {

          if (state.punches.isEmpty) {
            return const Center(
              child: Text(
                'No attendance records found',
              ),
            );
          }

          return ListView.builder(
            itemCount: state.punches.length,
            itemBuilder: (context, index) {

              final punch = state.punches[index];

              return ListTile(
                leading: const Icon(Icons.access_time),
                title: Text(punch.title),
                subtitle: Text(
                  punch.time.toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}