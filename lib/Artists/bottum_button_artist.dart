import 'package:artify_app/Artists/artist_profile.dart';
import 'package:artify_app/Artists/chat_artist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButtonArtist extends StatefulWidget {
  const BottomButtonArtist({super.key});

  @override
  State<BottomButtonArtist> createState() => _BottomButtonArtistState();
}

class _BottomButtonArtistState extends State<BottomButtonArtist> {
  int currentindex = 1;   
  final pages = [
    const
    ChatArtist(),
    ArtistProfile(),
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
                Icons.call,
                size: 30,
              ),
              label: currentindex == 0 ? 'Call' : ''),
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
