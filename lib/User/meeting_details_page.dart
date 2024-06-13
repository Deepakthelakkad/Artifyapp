// meeting_details_page.dart
import 'package:flutter/material.dart';

class MeetingDetailsPage extends StatelessWidget {
  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  MeetingDetailsPage({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    required this.isAllDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $eventName', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('From: $from', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('To: $to', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('All Day: ${isAllDay ? "Yes" : "No"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 50,
              color: background,
              alignment: Alignment.center,
              child: Text('Color Indicator', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
