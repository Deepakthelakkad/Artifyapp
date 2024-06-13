import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'meeting_details_page.dart';

class BookingViewSaved extends StatefulWidget {
  @override
  _BookingViewSavedState createState() => _BookingViewSavedState();
}

class _BookingViewSavedState extends State<BookingViewSaved> {
  List<Meeting> meetings = [];

  @override
  void initState() {
    super.initState();
    _loadMeetingsFromFirestore();
  }

  Future<void> _loadMeetingsFromFirestore() async {
    FirebaseFirestore.instance.collection('Events').get().then((querySnapshot) {
      setState(() {
        meetings = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Meeting(
            data['title'],
            (data['startTime'] as Timestamp).toDate(),
            (data['endTime'] as Timestamp).toDate(),
            Color(data['background']),
            data['isAllDay'],
          );
        }).toList();
      });
    });
  }

  void _navigateToMeetingDetails(BuildContext context, Meeting meeting) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeetingDetailsPage(
          eventName: meeting.eventName,
          from: meeting.from,
          to: meeting.to,
          background: meeting.background,
          isAllDay: meeting.isAllDay,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back),
              ),
            ),
            Text('Booking'),
          ],
        ),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(meetings),
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        onTap: (CalendarTapDetails details) {
          if (details.appointments != null) {
            final Meeting selectedMeeting = details.appointments!.cast<Meeting>().first;
            _navigateToMeetingDetails(context, selectedMeeting);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMeetingDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddMeetingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddMeetingDialog(
          onAddMeeting: (meeting) {
            setState(() {
              meetings.add(meeting);
            });
            _saveMeetingToFirestore(meeting);
          },
          existingMeetings: meetings,
        );
      },
    );
  }

  Future<void> _saveMeetingToFirestore(Meeting meeting) async {
    await FirebaseFirestore.instance.collection('Events').add({
      'title': meeting.eventName,
      'startTime': meeting.from,
      'endTime': meeting.to,
      'background': meeting.background.value,
      'isAllDay': meeting.isAllDay,
    });
  }
}


class AddMeetingDialog extends StatefulWidget {
  final Function(Meeting) onAddMeeting;
  final List<Meeting> existingMeetings;

  AddMeetingDialog({required this.onAddMeeting, required this.existingMeetings});

  @override
  _AddMeetingDialogState createState() => _AddMeetingDialogState();
}

class _AddMeetingDialogState extends State<AddMeetingDialog> {
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 11, minute: 0);
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Meeting'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          SizedBox(height: 8),
          ListTile(
            title: Text('Date: ${_selectedDate.toLocal()}'.split(' ')[0]),
            trailing: Icon(Icons.calendar_today),
            onTap: _pickDate,
          ),
          ListTile(
            title: Text('Start Time: ${_startTime.format(context)}'),
            trailing: Icon(Icons.access_time),
            onTap: _pickStartTime,
          ),
          ListTile(
            title: Text('End Time: ${_endTime.format(context)}'),
            trailing: Icon(Icons.access_time),
            onTap: _pickEndTime,
          ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 3 ),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Add'),
          onPressed: _addMeeting,
        ),
      ],
    );
  }

  void _addMeeting() {
    final String title = _titleController.text;
    if (title.isEmpty) {
      setState(() {
        _errorMessage = 'Title cannot be empty';
      });
      return;
    }

    final DateTime startTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _startTime.hour,
      _startTime.minute,
    );
    final DateTime endTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _endTime.hour,
      _endTime.minute,
    );

    // Check for overlapping meetings and maximum meetings per day
    final overlappingMeetings = widget.existingMeetings.where((meeting) {
      final isSameDay = isSameDate(meeting.from, _selectedDate);
      final isOverlapping = startTime.isBefore(meeting.to) && endTime.isAfter(meeting.from);
      return isSameDay && isOverlapping;
    }).isNotEmpty;

    final meetingsOnSameDay = widget.existingMeetings.where((meeting) {
      return isSameDate(meeting.from, _selectedDate);
    }).length;

    if (overlappingMeetings) {
      setState(() {
        _errorMessage = 'Meeting times overlap with an existing meeting';
      });
      return;
    }

    if (meetingsOnSameDay >= 2) {
      setState(() {
        _errorMessage = 'Cannot add more than 2 meetings on the same day';
      });
      return;
    }

    final Meeting newMeeting = Meeting(
      title,
      startTime,
      endTime,
      Colors.blue,
      false,
    );
    widget.onAddMeeting(newMeeting);
    Navigator.of(context).pop();
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickStartTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (pickedTime != null && pickedTime != _startTime) {
      setState(() {
        _startTime = pickedTime;
      });
    }
  }

  Future<void> _pickEndTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (pickedTime != null && pickedTime != _endTime) {
      setState(() {
        _endTime = pickedTime;
      });
    }
  }
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
