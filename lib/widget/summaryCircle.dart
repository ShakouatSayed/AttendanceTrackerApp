import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SummaryCircle extends StatelessWidget {
  final String title;
  final String count;
  final int percentage;
  final Color progressColor;
  final Color backgroundColor;

  const SummaryCircle({
    super.key,
    required this.title,
    required this.count,
    required this.percentage,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            alignment: Alignment.center,

            children: [
              CircularPercentIndicator(
                radius: 70,
                lineWidth: 15,
                percent: percentage / 100,
                progressColor: progressColor,
                backgroundColor: backgroundColor,
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 500,
              ),

              // CircularProgressIndicator(
              //   value: percentage / 100,
              //   strokeWidth: 14,

              //   color: color,
              //   backgroundColor: Colors.green,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    count,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  Text(
                    "($percentage%)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
