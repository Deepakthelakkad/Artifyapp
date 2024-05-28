import 'package:artify_app/Artists/chat_artist_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatArtist extends StatefulWidget {
  const ChatArtist({super.key});

  @override
  State<ChatArtist> createState() => _ChatArtistState();
}

class _ChatArtistState extends State<ChatArtist> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset("assets/logo small.png"),
              )
            ],
          ),
          Container(
            height: 80,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20 ),
                child: Row(
                  children: [
                    Text('Calls',style: TextStyle(fontSize: 32),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(' conveners',style: TextStyle(fontSize: 16,color: Color(0XFFADB5BD)),)
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
                Text('contacts',style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.call,color: Colors.blueAccent,)),
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
              subtitle: Text("call now",style: TextStyle(color: Color.fromRGBO(86, 227, 159, 1)),),
            ),
          )
        ],
      ),
    );
  }
}
