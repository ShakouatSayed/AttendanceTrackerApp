import 'package:AttendanceTrackerApp/my_app.dart';
import 'package:AttendanceTrackerApp/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AttendanceProvider(),
      child: const MyApp(),
    ),
  );
}
