import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsViewNr extends StatefulWidget {
  const EventsViewNr({super.key});

  @override
  State<EventsViewNr> createState() => _EventsViewNrState();
}

class _EventsViewNrState extends State<EventsViewNr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Color.fromRGBO(191, 68, 116, 1),
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text(
            'Events',
            style: TextStyle(
                color: Color.fromRGBO(191, 68, 116, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
