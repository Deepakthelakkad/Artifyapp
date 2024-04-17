import 'package:artify_app/Artists/artist_achievement.dart';
import 'package:artify_app/Artists/artist_event.dart';
import 'package:artify_app/Artists/schedule.dart';
import 'package:artify_app/Artists/settings_artist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistProfile extends StatefulWidget {
  const ArtistProfile({super.key});

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/A14.png'), // Replace with your image path
                    fit: BoxFit.cover),
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(40)),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsArtist()));
                    }, icon: Icon(CupertinoIcons.square_grid_2x2_fill,color: Colors.white,size: 30,)),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/AMLU.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              "Amaleswar",
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Dancer",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  "3y exp",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "PAYMENT    25000/-",
                        style: GoogleFonts.ubuntu(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
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
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.red.shade50,
              surfaceTintColor: Colors.deepOrange.shade50,
              elevation: 4,
              child: ListTile(
                leading: Text(
                  "Rating",
                  style: GoogleFonts.ubuntu(
                      fontSize: 15, color: Color.fromRGBO(134, 135, 142, 1)),
                ),
                trailing: Wrap(children: [
                  Icon(CupertinoIcons.star_fill,
                      color: Color.fromRGBO(230, 210, 28, 1)),
                  Icon(CupertinoIcons.star_fill,
                      color: Color.fromRGBO(230, 210, 28, 1)),
                  Icon(CupertinoIcons.star_fill,
                      color: Color.fromRGBO(230, 210, 28, 1)),
                  Icon(CupertinoIcons.star_fill,
                      color: Color.fromRGBO(230, 210, 28, 1)),
                  Icon(CupertinoIcons.star_fill,
                      color: Color.fromRGBO(217, 217, 217, 1)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    height: 225,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/Eventss.png'), // Replace with your image path
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtistEvent()));
                            },
                            child: Text("Events"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(190, 40),
                                backgroundColor: Color.fromRGBO(227, 154, 133,
                                    1), // Set the background color
                                foregroundColor:
                                Color.fromRGBO(100, 43, 27, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 225,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/achieve.png'), // Replace with your image path
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtistAchievement()));
                            },
                            child: Text("Acheivement"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(190, 40),
                                backgroundColor: Color.fromRGBO(227, 154, 133,
                                    1), // Set the background color
                                foregroundColor:
                                Color.fromRGBO(100, 43, 27, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 3),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Schedule()));
                },
                child: Container(
                  height: 87,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(44, 113, 109, 1),
                          Color.fromRGBO(72, 200, 200, 1),
                        ],
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Schedules',
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 44,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Image(
                          image: AssetImage('assets/Schedule.png'),
                          height: 87,
                          width: 102,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
