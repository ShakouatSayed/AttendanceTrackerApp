import 'package:flutter/material.dart';
import 'package:lotteryapp/model/student.dart';

// Finalized navigation logic
class AttendanceProvider extends ChangeNotifier {
  final List<Student> students = [
    Student(name: "Student 01"),
    Student(name: "Student 02"),
    Student(name: "Student 03"),
    Student(name: "Student 04"),
    Student(name: "Student 05"),
    Student(name: "Student 06"),
    Student(name: "Student 07"),
    Student(name: "Student 08"),
    Student(name: "Student 09"),
    Student(name: "Student 10"),
  ];

  void toggleAttendance(int index, bool value) {
    students[index].isPrasent = value;
    notifyListeners();
  }

  int get presnetCount => students.where((e) => e.isPrasent).length;

  int get absentCount => students.where((e) => !e.isPrasent).length;

  // Present Student
  String get presentStudents {
    final list = students.where((e) => e.isPrasent).map((e) => e.name).toList();
    return "(${list.join(', ')})";
  }

  // Absent Student
  String get absentStudent {
    final list = students
        .where((e) => !e.isPrasent)
        .map((e) => e.name)
        .toList();
    return "(${list.join(', ')})";
  }

  void clearAttendance() {
    for (var student in students) {
      student.isPrasent = false;
    }
    notifyListeners();
  }
}
