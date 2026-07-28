import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/attendance/bloc/attendance_bloc.dart';
import 'features/attendance/models/punch_model.dart';
import 'features/attendance/pages/home_page.dart';
import 'features/attendance/pages/main_navigation_page.dart';
import 'features/settings/bloc/settings_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(PunchModelAdapter());

  await Hive.openBox<PunchModel>('attendanceBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (_) => AttendanceBloc(),
        ),

        BlocProvider(
          create: (_) => SettingsBloc(),
        ),

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainNavigationPage(),
      ),
    );
  }
}