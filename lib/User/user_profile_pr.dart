import 'package:artify_app/User/saved_artist_pr.dart';
import 'package:artify_app/User/settings_pr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_profile_pr.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/A14.png'), // Replace with your image path
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                      Color.fromRGBO(60, 170, 212, 1),
                      Color.fromRGBO(109, 102, 101, 1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPr()));
                    }, icon: Icon(CupertinoIcons.square_grid_2x2_fill,color: Colors.white,size: 30,)),
                  ],
                ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/devanand.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        "Devanand",
                        style: GoogleFonts.ubuntu(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Card(
                color: Colors.red.shade50,
                surfaceTintColor: Colors.deepOrange.shade50,
                elevation: 4,
                child: ListTile(
                  leading: Text(
                    "Phone",
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Color.fromRGBO(134, 135, 142, 1)),
                  ),
                  trailing: Text(
                    "+91 9999999999",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.red.shade50,
                surfaceTintColor: Colors.deepOrange.shade50,
                elevation: 4,
                child: ListTile(
                  leading: Text(
                    "Email",
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Color.fromRGBO(134, 135, 142, 1)),
                  ),
                  trailing: Text(
                    "example@gmail.com",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.red.shade50,
                surfaceTintColor: Colors.deepOrange.shade50,
                elevation: 4,
                child: ListTile(
                  leading: Text(
                    "Place",
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Color.fromRGBO(134, 135, 142, 1)),
                  ),
                  trailing: Text(
                    "Kochi",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.red.shade50,
                surfaceTintColor: Colors.deepOrange.shade50,
                elevation: 4,
                child: ListTile(
                  leading: Text(
                    "Address",
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Color.fromRGBO(134, 135, 142, 1)),
                  ),
                  trailing: Text(
                    "",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SavedArtists()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                      height: 53,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(87, 184, 62, 1),
                            Color.fromRGBO(87, 185, 63, 1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text('Saved Artists',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                )),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                      height: 53,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(191, 69, 113, 1),
                            Color.fromRGBO(198, 81, 99, 1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text('Edit Profile',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                )
            ),
          ],
        ),
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
