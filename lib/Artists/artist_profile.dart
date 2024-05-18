import 'package:artify_app/Artists/artist_achievement.dart';
import 'package:artify_app/Artists/artist_event.dart';
import 'package:artify_app/Artists/schedule.dart';
import 'package:artify_app/Artists/settings_artist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistProfile extends StatefulWidget {
  const ArtistProfile({super.key});

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {
  var ID;

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      print(ID.toString());
    });
    print('data updated');
  }

  DocumentSnapshot? artist;

  GETDetail() async {
    artist =
        await FirebaseFirestore.instance.collection("ArtReg").doc(ID).get();
    print("get");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GETDetail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 210,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsArtist()));
                              },
                              icon: Icon(
                                CupertinoIcons.square_grid_2x2_fill,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "assets/pp.png",
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
                                  artist!["Name"],
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      artist!["Category"],
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          artist!["Experience"],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "y exp",
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
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "PAYMENT",
                            style: GoogleFonts.ubuntu(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            artist!["Fee per program"],
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
                  height: 5,
                ),
                Card(
                  color: Colors.red.shade50,
                  surfaceTintColor: Colors.deepOrange.shade50,
                  elevation: 4,
                  child:artist!["Bio"]==null?ListTile(
                    leading: Text(
                      "Bio",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: Color.fromRGBO(134, 135, 142, 1)),
                    ),
                    trailing: Text(
                      "",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ): ListTile(
                    leading: Text(
                      "Bio",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: Color.fromRGBO(134, 135, 142, 1)),
                    ),
                    trailing: Text(
                      artist!['Bio'],
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ),
                ),
                Card(
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
                      artist!["Place"],
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
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
                          fontSize: 15,
                          color: Color.fromRGBO(134, 135, 142, 1)),
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
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        height: 225,
                        width: 155,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Eventss.png'),
                                // Replace with your image path
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
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
                                    backgroundColor: Color.fromRGBO(227, 154,
                                        133, 1), // Set the background color
                                    foregroundColor:
                                        Color.fromRGBO(100, 43, 27, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                                image: AssetImage('assets/achieve.png'),
                                // Replace with your image path
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
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
                                          builder: (context) =>
                                              ArtistAchievement()));
                                },
                                child: Text("Acheivement"),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(190, 40),
                                    backgroundColor: Color.fromRGBO(227, 154,
                                        133, 1), // Set the background color
                                    foregroundColor:
                                        Color.fromRGBO(100, 43, 27, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Schedule()));
                    },
                    child: Container(
                      height: 72,
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
                              width: 93,
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
      },
    );
  }
}
