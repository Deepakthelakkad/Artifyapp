import 'package:artify_app/NormalUser/artist_profile_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/logo small.png")
            ],
          ),
          Container(
            height: 80,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text('messages',style: TextStyle(fontSize: 32),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text('7 conveners',style: TextStyle(fontSize: 16,color: Color(0XFFADB5BD)),)
                  ],
                ),
              ),
            ],),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            height: 30,
            color: Colors.grey.shade100,
            child: Icon(CupertinoIcons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text('Chats',style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                child: ClipOval(
                  child: Image.asset(
                    "assets/Pic.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text("Akash"),
              subtitle: Text("online"),
            ),
          )
        ],
      ),
    );
  }
}
