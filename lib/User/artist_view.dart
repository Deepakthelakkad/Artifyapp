import 'package:artify_app/User/booking_pr.dart';
import 'package:artify_app/User/events.dart';
import 'package:artify_app/User/user_homepage_pr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'achievement_pr.dart';

class ArtistView extends StatefulWidget {
  const ArtistView({super.key, required this.id});
  final id;

  @override
  State<ArtistView> createState() => _ArtistViewState();
}

class _ArtistViewState extends State<ArtistView> {
  var fav = 0;
  GETFILE() async {
    artist = await FirebaseFirestore.instance
        .collection('ArtReg')
        .doc(widget.id)
        .get();
  }

  DocumentSnapshot? artist;

  deletedata() {
    FirebaseFirestore.instance.collection("favartist").doc(widget.id).delete();
  }

  adddata() {
    FirebaseFirestore.instance
        .collection("favartist")
        .add({"userid": widget.id});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: GETFILE(),
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
                        SizedBox(
                          height: 5,
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(CupertinoIcons.back,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              fav == 0
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          fav = 1;
                                          print("object");
                                          adddata();
                                        });
                                      },
                                      icon: Icon(
                                        CupertinoIcons.bookmark,
                                        color: Colors.white,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          fav = 0;
                                          print("delete");
                                          deletedata();
                                        });
                                      },
                                      icon: Icon(
                                        CupertinoIcons.bookmark_fill,
                                        color: Colors.white,
                                      )),
                              // IconButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       _isBookmarked = !_isBookmarked;
                              //       if (_isBookmarked = true) {
                              //         fav = 1;
                              //       }
                              //       if (_isBookmarked = false) {
                              //         fav = 0;
                              //       }
                              //     });
                              //   },
                              //   icon: Icon(
                              //     fav == 1
                              //         ? CupertinoIcons.bookmark_fill
                              //         : CupertinoIcons.bookmark,
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ],
                          ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    height: 12,
                  ),
                  Card(
                    color: Colors.red.shade50,
                    surfaceTintColor: Colors.deepOrange.shade50,
                    elevation: 4,
                    child: ListTile(
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
                          artist!["Place"],
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(43, 44, 47, 1)),
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
                                            builder: (context) => Events()));
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
                                  image: AssetImage(
                                      'assets/achieve.png'), // Replace with your image path
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
                                                Acheivement()));
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
                            MaterialPageRoute(builder: (context) => Booking()));
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
                              child: Text('Book Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 44,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Image(
                                image: AssetImage('assets/book.png'),
                                height: 67,
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
        },
      ),
    );
  }
}
