
import 'package:artify_app/User/user_homepage_pr.dart';
import 'package:artify_app/User/user_profile_pr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_list_pr.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  int currentindex = 1;
  final pages = [
    const ChatList(),
    UserHomepage(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (newIndex) {
          setState(() {
            currentindex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.ellipses_bubble_fill,
                size: 30,
              ),
              label: currentindex == 0 ? 'message' : ''),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                child: Icon(
                  CupertinoIcons.house,
                  color: Colors.white,
                ),
                radius: 20,
                backgroundColor: Color.fromRGBO(191, 68, 116, 1),
              ),
              label: currentindex == 1 ? 'Home' : ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill, size: 30),
              label: currentindex == 2 ? 'Profile' : ''),
        ],
        selectedItemColor: Color.fromRGBO(191, 68, 116, 1),

        unselectedItemColor: Color.fromRGBO(143, 154, 163, 1),
        selectedLabelStyle: TextStyle(color: Color.fromRGBO(191, 68, 116, 1)),

      ),
    );
  }
}
