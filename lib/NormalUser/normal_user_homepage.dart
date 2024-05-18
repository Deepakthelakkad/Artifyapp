import 'package:artify_app/NormalUser/artist_view_nr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dancers.dart';
import 'musicians.dart';
import 'singers.dart';

class NormalUserHomepage extends StatefulWidget {
  const NormalUserHomepage({super.key});

  @override
  State<NormalUserHomepage> createState() => _NormalUserHomepageState();
}

class _NormalUserHomepageState extends State<NormalUserHomepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.back,
                      color: Color.fromRGBO(194, 74, 107, 1))),
              title: Padding(
                padding: const EdgeInsets.only(left: 80, top: 10),
                child: Container(
                  child: Text(
                    "Artists",
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(194, 74, 107, 1)),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Container(
                    height: 50,
                    // width: 330.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(194, 74, 107, 1)),
                      tabs: [
                        Tab(
                            child: Text(
                          'Musician',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )),
                        Tab(
                            child: Text(
                          'Dancer',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )),
                        Tab(
                            child: Text(
                          'Singer',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:
                      TabBarView(children: [Musicians(), Dancers(), Singers()]),
                )
              ],
            )
        ),
      ),
    );
  }
}
// FutureBuilder(
// future: FirebaseFirestore.instance.collection("ArtReg").get(),
// builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(child: CircularProgressIndicator());
// }
// if (snapshot.hasError) {
// return Text("Error${snapshot.error}");
// }
// final artist = snapshot.data?.docs ?? [];
// return ListView.builder(
// itemCount: artist.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
// child: Card(
// elevation: 0,
// child: ListTile(
// leading: Container(
// child: ClipOval(
// child: Image.asset(
// "assets/AMLU.png",
// height: 50,
// width: 50,
// fit: BoxFit.cover,
// ),
// ),
// ),
// trailing: InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => ArtistViewNr()));
// },
// child: Container(
// height: 28,
// width: 54,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Color.fromRGBO(47, 128, 237, 1),
// ),
// child: Padding(
// padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
// child: Text("Check",
// style: GoogleFonts.ubuntu(
// color: Colors.white)),
// ),
// ),
// ),
// title: Text("Amaleswar"),
// subtitle: Row(
// children: [
// Text("Dancer"),
// SizedBox(
// width: 10,
// ),
// Text("3y exp"),
// ],
// ),
// ),
// ),
// );
// });
// }
// ),
