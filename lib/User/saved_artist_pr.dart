import 'package:artify_app/User/saved_artist_view_pr.dart';
import 'package:artify_app/User/user_profile_pr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'artist_view.dart';

class SavedArtists extends StatefulWidget {
  const SavedArtists({super.key});

  @override
  State<SavedArtists> createState() => _SavedArtistsState();
}

class _SavedArtistsState extends State<SavedArtists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Color.fromRGBO(191, 68, 116, 1),
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'Saved Artists',
            style: TextStyle(
                color: Color.fromRGBO(191, 68, 116, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("favartist").get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error${snapshot.error}");
            }
            final artist = snapshot.data?.docs ?? [];
            return ListView.builder(
                itemCount: artist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Card(
                      elevation: 0,
                      child: ListTile(
                        leading: Container(
                          child: ClipOval(
                            child: Image.asset(
                              "assets/pp.png",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(artist[index]["artistname"]),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text(artist[index]["artistcategory"]),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(artist[index]["artistexp"]),
                                    Text("y exp")
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SavedArtistView(
                                                      id: artist[index]
                                                          ["artistid"])));
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(47, 128, 237, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 5, 5),
                                        child: Center(
                                          child: Text("Check",
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        FirebaseFirestore.instance.collection("favartist").doc(artist[index].id).delete();
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(203, 29, 29, 1.0),
                                      ),
                                      child: Center(
                                        child: Text("Ban",
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
