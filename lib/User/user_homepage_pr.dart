import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'artist_view.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  var feature = "arun";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          // child: Icon(CupertinoIcons.back,color: Color.fromRGBO(194, 74, 107, 1),),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Container(
            child: Text(
              "Artists",
              style:
              TextStyle(fontSize: 25, color: Color.fromRGBO(194, 74, 107, 1)),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feature.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Container(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/AMLU.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArtistView()));
                      },
                      child: Container(
                        height: 28,
                        width: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(47, 128, 237, 1),),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Text("Check",
                              style: GoogleFonts.ubuntu(color: Colors.white)),
                        ),
                      ),
                    ),
                    title: Text("Amaleswar"),
                    subtitle: Row(
                      children: [
                        Text("Dancer"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("3y exp"),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           CupertinoIcons.ellipses_bubble_fill,
      //           size: 30,
      //         ),
      //         label: _selectedIndex == 0 ? 'message' : ''),
      //     BottomNavigationBarItem(
      //         icon: CircleAvatar(
      //           child: Icon(CupertinoIcons.house, color: Colors.white,),
      //           radius: 20,
      //           backgroundColor: Color.fromRGBO(191, 68, 116, 1),),
      //         label: _selectedIndex == 1 ? 'Home' : ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.person_fill, size: 30),
      //         label: _selectedIndex == 2 ? 'Profile' : ''),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color.fromRGBO(191, 68, 116, 1),
      //   unselectedItemColor: Color.fromRGBO(143, 154, 163, 1),
      //   selectedLabelStyle: TextStyle(color: Color.fromRGBO(191, 68, 116, 1)),
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
