import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsNr extends StatefulWidget {
  const EventsNr({super.key});

  @override
  State<EventsNr> createState() => _EventsNrState();
}

class _EventsNrState extends State<EventsNr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.back,color: Color.fromRGBO(191, 68, 116, 1),)),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text('Events',style: TextStyle(color: Color.fromRGBO(191, 68, 116, 1),fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
