// lib/screens/exam_schedule_screen.dart

import 'package:flutter/material.dart';
import '../widgets/add_schedule_form.dart';

class ExamScheduleScreen extends StatefulWidget {
  @override
  _ExamScheduleScreenState createState() => _ExamScheduleScreenState();
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  List<Map<String, String?>> exams = [
    {'subject': 'Math', 'date': '2023-08-15', 'time': '09:00 AM'},
    {'subject': 'History', 'date': '2023-08-17', 'time': '10:30 AM'},
    {'subject': 'Physics', 'date': '2023-08-20', 'time': '02:00 PM'},
  ]; // Predefined exams

  void _openAddScheduleSegment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              AddScheduleForm(
                onSubjectAdded: (newSubject, newDate, newTime) {
                  setState(() {
                    exams.add({'subject': newSubject, 'date': newDate, 'time': newTime});
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Schedule'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openAddScheduleSegment(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(exams[index]['subject'] ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                'Date: ${exams[index]['date'] ?? ''}\nTime: ${exams[index]['time'] ?? ''}',
              ),
            ),
          );
        },
      ),
    );
  }
}
