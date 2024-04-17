import 'package:artify_app/User/saved_artist_view_pr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPr extends StatefulWidget {
  const EventPr({super.key});

  @override
  State<EventPr> createState() => _EventPrState();
}

class _EventPrState extends State<EventPr> {
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
