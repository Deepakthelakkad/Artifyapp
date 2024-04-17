import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'artist_view.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
