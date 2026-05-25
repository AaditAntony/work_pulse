import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/attendance_bloc.dart';
import '../bloc/attendance_event.dart';
import '../bloc/attendance_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WorkPulse')),

      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),

                Text(
                  'Current Status',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    state.status.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                if (state.status == AttendanceStatus.initial)
                  ElevatedButton(
                    onPressed: () {
                      context.read<AttendanceBloc>().add(LunchOutPressed());
                    },
                    child: const Text('Lunch OUT'),
                  ),

                const SizedBox(height: 15),

                if (state.status == AttendanceStatus.officeInCompleted)
                  ElevatedButton(
                    onPressed: () {
                      context.read<AttendanceBloc>().add(LunchOutPressed());
                    },
                    child: const Text('Lunch OUT'),
                  ),

                const SizedBox(height: 15),

                if (state.status == AttendanceStatus.lunchOutCompleted)
                  ElevatedButton(
                    onPressed: () {
                      context.read<AttendanceBloc>().add(LunchInPressed());
                    },
                    child: Text(""),
                  ),

                const SizedBox(height: 15),

              if(state.status==AttendanceStatus.lunchInCompleted)
                ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceBloc>().add(OfficeOutPressed());
                  },
                  child: const Text('Office OUT'),
                ),

                const SizedBox(height: 15),

                if(state.status==AttendanceStatus.officeOutCompleted)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green.shade100,
                    ),
                    child: const Text(
                      'Attendance Completed Successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceBloc>().add(
                      ResetAttendancePressed(),
                    );
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
