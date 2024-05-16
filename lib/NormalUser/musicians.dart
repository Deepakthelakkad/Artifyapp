import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Musicians extends StatefulWidget {
  const Musicians({super.key});

  @override
  State<Musicians> createState() => _MusiciansState();
}

class _MusiciansState extends State<Musicians> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("ArtReg").where("Category",isEqualTo:"Musician" ).get(),
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
                              "assets/AMLU.png",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 28,
                            width: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(47, 128, 237, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                              child: Text("Check",
                                  style:
                                      GoogleFonts.ubuntu(color: Colors.white)),
                            ),
                          ),
                        ),
                        title: Text(artist[index]["Name"]),
                        subtitle: Row(
                          children: [
                            Text(artist[index]["Category"]),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text(artist[index]["Experience"]),
                                Text("y exp")
                              ],
                            ),
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
