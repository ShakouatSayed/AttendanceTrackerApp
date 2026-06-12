import 'package:flutter/material.dart';
import 'package:lotteryapp/my_app.dart';
import 'package:lotteryapp/provider/attendance_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AttendanceProvider(),
      child: const MyApp(),
    ),
  );
}
