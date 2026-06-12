import 'package:flutter/material.dart';
import 'package:lotteryapp/provider/attendance_provider.dart';
import 'package:lotteryapp/widget/summaryCircle.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  provider.clearAttendance();
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),

              Center(
                child: Text(
                  "Attendance Summary",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SummaryCircle(
                    title: "Present",
                    count:
                        "${provider.presnetCount}/${provider.students.length}",
                    percentage: provider.presnetCount,
                    progressColor: const Color.fromARGB(255, 10, 136, 14),
                    backgroundColor: Colors.green.shade300,
                  ),

                  SummaryCircle(
                    title: "Absent",
                    count:
                        "${provider.absentCount}/${provider.students.length}",
                    percentage: provider.absentCount,
                    progressColor: Colors.black,
                    backgroundColor: Colors.black38,
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Present Students: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(provider.presentStudents),
                    SizedBox(height: 20),

                    Text(
                      "Absent Students: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(provider.absentStudent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
