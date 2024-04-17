import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatProfile extends StatefulWidget {
  const ChatProfile({super.key});

  @override
  State<ChatProfile> createState() => _ChatProfileState();
}

class _ChatProfileState extends State<ChatProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(249, 249, 250, 1),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(CupertinoIcons.arrow_left)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Image.asset('assets/Pic.png'),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Column(
                    children: [
                      Text(
                        'Akash',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("online",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(86, 227, 159, 1))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
