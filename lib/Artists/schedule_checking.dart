import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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

  void _showMeetingDetailsDialog(BuildContext context, List<Meeting> meetings) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Meetings'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: meetings.length,
              itemBuilder: (BuildContext context, int index) {
                final meeting = meetings[index];
                return ListTile(
                  title: Text(meeting.eventName),
                  subtitle: Text(
                    '${meeting.from} - ${meeting.to}',
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
                  icon: Icon(CupertinoIcons.back)),
            ),
            Text('Schedule'),
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
            final List<Meeting> selectedMeetings = details.appointments!.cast<Meeting>();
            _showMeetingDetailsDialog(context, selectedMeetings);
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

  AddMeetingDialog({required this.onAddMeeting});

  @override
  _AddMeetingDialogState createState() => _AddMeetingDialogState();
}

class _AddMeetingDialogState extends State<AddMeetingDialog> {
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 11, minute: 0);

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
          onPressed: () {
            final String title = _titleController.text;
            if (title.isNotEmpty) {
              final DateTime startTime = DateTime(
                _selectedDate.year,
                _selectedDate.month,
                _selectedDate.day,
                this._startTime.hour,
                this._startTime.minute,
              );
              final DateTime endTime = DateTime(
                _selectedDate.year,
                _selectedDate.month,
                _selectedDate.day,
                this._endTime.hour,
                this._endTime.minute,
              );
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
          },
        ),
      ],
    );
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
