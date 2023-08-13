import 'package:flutter/material.dart';
import 'screens/exam_schedule_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExamScheduleScreen(),
    );
  }
}
