import 'package:flutter/material.dart';
import 'package:lotteryapp/provider/attendance_provider.dart';
import 'package:lotteryapp/screen/summary_screen.dart';
import 'package:provider/provider.dart';

// Implemented UI
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              InkWell(onTap: () {}, child: Icon(Icons.arrow_back)),
              SizedBox(height: 20),
              Text(
                "Daily Attendance-June 10",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              Card(
                color: Colors.white,

                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: provider.students.length,
                  itemBuilder: (context, index) {
                    final student = provider.students[index];
                    return ListTile(
                      minTileHeight: 40,
                      contentPadding: EdgeInsets.zero,
                      title: Text(student.name),

                      trailing: Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          value: student.isPrasent,
                          activeColor: Colors.green,

                          shape: CircleBorder(),

                          onChanged: (value) {
                            provider.toggleAttendance(index, value ?? false);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SummaryScreen()),
                    );
                  },

                  child: Text("Submit", style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
