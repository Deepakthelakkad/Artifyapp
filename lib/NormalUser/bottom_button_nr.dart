import 'package:artify_app/NormalUser/home_nr_user.dart';
import 'package:artify_app/NormalUser/profile_nr_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButtonNr extends StatefulWidget {
  const BottomButtonNr({super.key});

  @override
  State<BottomButtonNr> createState() => _BottomButtonNrState();
}

class _BottomButtonNrState extends State<BottomButtonNr> {
  int currentindex = 0;
  final pages = [
    const
    HomeNrUser(),
    ProfileNormalUser(),
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
              icon: CircleAvatar(
                child: Icon(
                  CupertinoIcons.house,
                  color: Colors.white,
                ),
                radius: 20,
                backgroundColor: Color.fromRGBO(191, 68, 116, 1),
              ),
              label: currentindex == 0 ? 'Home' : ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill, size: 30),
              label: currentindex == 1 ? 'Profile' : ''),
        ],
        selectedItemColor: Color.fromRGBO(191, 68, 116, 1),

        unselectedItemColor: Color.fromRGBO(143, 154, 163, 1),
        selectedLabelStyle: TextStyle(color: Color.fromRGBO(191, 68, 116, 1)),

      ),
    );
  }
}
